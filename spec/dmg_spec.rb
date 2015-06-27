require 'spec_helper.rb'

describe "Rake::DmgTask" do
  it "should build a DmgTask object" do
    dmg = Rake::DmgTask.new 'pimpernel', '0.1'
    dmg.should be_an_instance_of(Rake::DmgTask)
  end

  it "should build a DmgTask object with an optional block" do
    dmg = Rake::DmgTask.new 'pimpernel', '0.1' do |b|
      # nothing to do here.
    end
    dmg.should be_an_instance_of(Rake::DmgTask)
  end

  it "should require version" do
    lambda {Rake::DmgTask.new 'pimpernel'}.should raise_error do |err|
      err =~ /^Version required/
    end
  end

  it "should accept :noversion" do
    lambda {Rake::DmgTask.new 'pimpernel', :noversion}.should_not raise_error
  end

  describe '' do
    before do
      Rake::Task.clear
      Rake::DmgTask.new 'pimpernel', :noversion
    end

    it "should define dmg task" do
      'dmg'.should be_defined
    end

    it "should define clobber_dmg task" do
      'clobber_dmg'.should be_defined
    end

    it "should add clobber_dmg to clobber" do
      'clobber'.should be_defined
      'clobber'.should have_prerequisites('clobber_dmg')
    end

    it "should define rebuild_dmg task" do
      'rebuild_dmg'.should be_defined
      'rebuild_dmg'.should have_prerequisites('clobber_dmg', 'dmg')
    end
  end
end

describe "A Rake::DmgTask object" do
  before do
    Rake::Task.clear
    @rose = Rake::DmgTask.new 'rose', :noversion
    @pimpernel = Rake::DmgTask.new 'pimpernel', '0.1'
  end

  it "should have a name" do
    @rose.name.should eql('rose')
  end

  it "should allow changing name on creation via block" do
    custom_pkg_dmg = Rake::DmgTask.new 'cyclamen', :noversion do |p|
      p.name = 'violet'
    end
    custom_pkg_dmg.name.should eql('violet')
    'pkg/violet.dmg'.should be_defined
    'pkg/cyclamen.dmg'.should_not be_defined
  end

  it "should ignore changes to name after creation" do
    @rose.name = 'violet'
    @rose.name.should eql('violet')
    'pkg/rose.dmg'.should be_defined
    'pkg/violet.dmg'.should_not be_defined
  end

  it "should have a version" do
    @rose.version.should be_nil
    @pimpernel.version.should eql('0.1')
  end

  it "should allow changing version on creation via block" do
    custom_pkg_dmg = Rake::DmgTask.new 'cyclamen', :noversion do |p|
      p.version = '0.1'
    end
    custom_pkg_dmg.version.should eql('0.1')
    'pkg/cyclamen-0.1.dmg'.should be_defined
    'pkg/cyclamen.dmg'.should_not be_defined
  end

  it "should ignore changes to version after creation" do
    @rose.version = '0.1'
    @rose.version.should eql('0.1')
    'pkg/rose-0.1.dmg'.should_not be_defined
    'pkg/rose.dmg'.should be_defined
  end

  it "should default to pkg directory" do
    @rose.package_dir.should eql('pkg')
    'pkg'.should be_defined
  end

  it "should allow custom package directory on creationg" do
    custom_pkg_dmg = Rake::DmgTask.new 'cyclamen', :noversion do |p|
      p.package_dir = 'custom_pkg'
    end
    custom_pkg_dmg.package_dir.should eql('custom_pkg')
    'custom_pkg/cyclamen.dmg'.should be_defined
    'pkg/cyclamen.dmg'.should_not be_defined
  end

  it "should ignore changes to package dir after creation" do
    @rose.package_dir = 'custom_pkg'
    @rose.package_dir.should eql('custom_pkg')
    'pkg/rose.dmg'.should be_defined
    'custom_pkg/rose.dmg'.should_not be_defined
  end

  it "should start with empty source lists" do
    @rose.source_files.should be_empty
    @rose.extra_source_files.should be_empty
    Rake::Task[@rose.dmg_dir_path].prerequisites.should be_empty
  end

  it "should allow custom source lists on creationg" do
    custom_pkg_dmg = Rake::DmgTask.new 'cyclamen', :noversion do |p|
      p.source_files.include 'Rakefile'
      p.extra_source_files = {'test.rb' => '/a/test_with_another_name.rb'}
    end
    custom_pkg_dmg.source_files.should_not be_empty
    custom_pkg_dmg.extra_source_files.should_not be_empty
    custom_pkg_dmg.dmg_dir_path.should have_prerequisites('Rakefile', 'test.rb')
  end

  it "should ignore changes to source lists after creation" do
    @rose.source_files.include 'Rakefile'
    @rose.source_files.should_not be_empty
    @rose.extra_source_files = {'test.rb' => '/a/test_with_another_name.rb'}
    @rose.extra_source_files.should_not be_empty
    Rake::Task[@rose.dmg_dir_path].prerequisites.should be_empty
  end

  it "should default to hdiutil" do
    @pimpernel.dmg_command.should eql('hdiutil')
  end

  it "should allow custom dmg command" do
    @pimpernel.dmg_command = 'whatever_you_want'
    @pimpernel.dmg_command.should eql('whatever_you_want')
  end

  it "should default to not have administration rights" do
    @rose.admin_rights.should be_falsey
  end

  it "should allow setting administration rights on creation" do
    custom_pkg_dmg = Rake::DmgTask.new 'cyclamen', :noversion do |dmg|
      dmg.admin_rights = true
    end
    custom_pkg_dmg.admin_rights.should be_truthy
  end

  it "should allow setting administration rights after creation" do
    @rose.admin_rights.should be_falsey
    @rose.admin_rights = true
    @rose.admin_rights.should be_truthy
  end

  it "should change DMG build options based on administration rights presence" do
    old_options = @rose.dmg_options
    @rose.admin_rights = true
    @rose.dmg_options.should_not eql(old_options)
    @rose.admin_rights = false
    @rose.dmg_options.should eql(old_options)
  end

  it "should allow setting totally new DMG build options any time" do
    old_options = @rose.dmg_options
    new_options = '-not -really -options'
    @rose.dmg_options = new_options
    @rose.dmg_options.should eql(new_options)
    @rose.dmg_options = nil
    @rose.dmg_options.should eql(old_options)
  end

  it "should default to empty strip prefix" do
    @rose.strip.should be_nil
  end

  it "should allow setting strip prefix any time" do
    old_strip = @rose.strip
    new_strip = 'path/to/stip/out'
    @rose.strip = new_strip
    @rose.strip.should eql(new_strip)
    @rose.strip = old_strip
    @rose.strip.should eql(old_strip)
  end

  it "should create the volume name" do
    @rose.dmg_name.should eql('rose')
    @pimpernel.dmg_name.should eql('pimpernel-0.1')
  end

  it "should create the dmg name" do
    @rose.dmg_file.should eql('rose.dmg')
    @pimpernel.dmg_file.should eql('pimpernel-0.1.dmg')
  end
end
