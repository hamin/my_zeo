require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "my_zeo"
    gem.summary = %Q{A simple mapping to MyZeo API calls (http://mysleep.myzeo.com/api/api.shtml)}
    gem.description = %Q{A simple mapping to MyZeo API calls (http://mysleep.myzeo.com/api/api.shtml)}
    gem.email = "aminharis7@gmail.com"
    gem.homepage = "http://github.com/hamin/my_zeo"
    gem.authors = ["Haris Amin"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.add_dependency 'httparty'
    gem.files = Dir.glob('lib/**/*.rb')
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "my_zeo #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :remove_build do
  Dir.open(Dir.pwd+"/pkg/").entries.grep(/my_/).each{|file| exec("rm pkg/#{file}")}
end

task :uninstall_build do
  exec("gem uninstall my_zeo") if `gem list my_zeo`.include?('my_zeo')
end

task :clean_up_build => [:uninstall_build,:remove_build]

task :create_build => [:build,:install]

task :rebuild => [:remove_build,:build,:uninstall_build,:install]