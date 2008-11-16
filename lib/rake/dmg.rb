#!/usr/bin/env ruby

# Define a DMG task libarary to automate the creation of disk images.

require 'rake'

module Rake
  # Create a packaging task that will package the project into a distributable
  # disk image.
  #
  # The DmgTask will create the following targets:
  #
  # [<b>:dmg</b>]
  #   Create the requested DMG file.
  #
  # [<b>:clobber_dmg</b>]
  #   Delete the disk image. Automatically added to the main clobber target.
  #
  # [<b>:rebuild_dmg</b>]
  #   Rebuild the disk image from scratch.
  #
  # Example:
  #
  #   Rake::DmgTask.new("pimpernel", :noversion) do |p|
  #     p.source_files.include("lib/**/*.rb")
  #     p.extra_source_files = {'resources/ds_store' => '/.DS_Store',
  #       'resources/background.png' => '/.background/background.png'}
  #   end
  #
  class DmgTask
    # Name of the disk image (required).
    attr_accessor :name

    # Version of the DMG (required; use :noversion for unversioned disk images).
    attr_accessor :version

    # Directory used to store the disk image (default: 'pkg').
    attr_accessor :package_dir

    # List of files to be included in the DMG file (default: empty).
    attr_accessor :source_files

    # List of extra files to be included in the DMG file (default: empty).
    # Each item is a couple key/value: key is the source, value is the target
    # inside the DMG.
    attr_accessor :extra_source_files

    # System utility used to build the DMG file (default: hdiutil).
    attr_accessor :dmg_command

    # Create a Package Task with the given name and version.
    def initialize(name=nil, version=nil)
      @name = name
      @version = version
      @package_dir = 'pkg'
      @source_files = Rake::FileList.new
      @extra_source_files = {}
      @dmg_command = 'hdiutil'
      yield self if block_given?
      define_tasks unless name.nil?
    end

    # Create the tasks defined by this task library.
    def define_tasks
      fail "Version required (or :noversion)" if @version.nil?
      @version = nil if :noversion == @version

      desc "Build the disk image file"
      task :dmg => "#{package_dir}/#{dmg_file}"

      file "#{package_dir}/#{dmg_file}" => dmg_dir_path do
        chdir package_dir do
          sh "#{dmg_command} create #{dmg_options}"
        end
      end

      directory package_dir

      file dmg_dir_path => source_files + extra_source_files.keys do
        mkdir_p package_dir rescue nil
        source_files.each do |fn|
          f = File.join(dmg_dir_path, fn)
          fdir = File.dirname(f)
          mkdir_p(fdir) if !File.exist?(fdir)
          if File.directory?(fn)
            mkdir_p(f)
          else
            rm_f f
            safe_ln(fn, f)
          end
        end
        extra_source_files.each do |k, v|
          f = File.join(dmg_dir_path, v)
          mkdir_p(File.dirname(f)) rescue nil
          rm_f f
          safe_ln k, f
        end
      end

      desc "Remove the disk image files"
      task :clobber_dmg do
        rm_r package_dir rescue nil
      end

      task :clobber => :clobber_dmg

      desc "Force a rebuild of the disk image file"
      task :rebuild_dmg => [:clobber_dmg, :dmg]

      self
    end

    def dmg_name
      @version ? "#{@name}-#{@version}" : @name
    end

    def dmg_file
      dmg_name + '.dmg'
    end

    def dmg_options
      "-srcdir #{dmg_name} -ov -volname #{name} -uid 99 -gid 99 #{dmg_file}"
    end

    def dmg_dir_path
      "#{package_dir}/#{dmg_name}"
    end
  end
end
