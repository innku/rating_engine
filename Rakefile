# encoding: UTF-8

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Run Rating Engine unit tests.'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "rating_engine"
    gemspec.summary = "Fork of acts_as_rateable plugin. Ratings as an engine."
    gemspec.description = "Attempts to take advantage of the acts_as_rateable plugin and make it unobstrusive and flexible using Rails 3 Engines."
    gemspec.email = "adrian@innku.com"
    gemspec.homepage = "http://github.com/adriancuadros/acts_as_rateable"
    gemspec.authors = ["Adrian Cuadros"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end