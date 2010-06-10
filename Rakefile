require 'rubygems'
require 'rake'
require 'rake/gempackagetask'
gem 'rspec'
require 'spec/version'
require 'spec/rake/spectask'
require 'spec/ruby'

task :default => [:package] 

spec = Gem::Specification.load "prawn-blank.gemspec"
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

gem 'hoe', '>=2.0.0'
require 'hoe'

require 'spec/version'
require 'spec/rake/spectask'
require 'spec/ruby'

Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
end



desc "Look for TODO and FIXME tags in the code"
task :todo do
  egrep /(FIXME|TODO|TBD)/
end