require 'rake'
require 'rake/testtask'
$LOAD_PATH.unshift('lib')

require 'rake/rdoctask'
require 'spec/rake/spectask'


WEB_ROOT = File.expand_path('~/Projects/slagyr.github.com/sparring/hangman')

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['hangman/spec/**/*.rb']
  t.rcov = false
end

desc 'Generate RDoc'
rd = Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = WEB_ROOT
  rdoc.options << '--title' << 'Hangman' << '--line-numbers' << '--inline-source' << '--main' << 'README'
  rdoc.rdoc_files.include('README')
end
task :rdoc

task :verify_user do
  raise "RUBYFORGE_USER environment variable not set!" unless ENV['RUBYFORGE_USER']
end

task :verify_password do
  raise "RUBYFORGE_PASSWORD environment variable not set!" unless ENV['RUBYFORGE_PASSWORD']
end

desc "Upload Website to RubyForge"
task :publish_rubyforge_site => [:verify_user, :verify_password] do
  require 'rake/contrib/rubyforgepublisher'
  publisher = Rake::SshDirPublisher.new(
    "#{ENV['RUBYFORGE_USER']}@rubyforge.org",
    "/var/www/gforge-projects/sparring/",
    "website"
  )

  publisher.upload
end

desc "Build the hangman.llp file and install in website dir"
task :llp do
  system "rm hangman.llp"
  system "jruby -S limelight pack hangman"
  system "cp hangman.llp #{WEB_ROOT}"
end