# -*- encoding: utf-8 -*-

require 'yaml'
YAML::ENGINE.yamler='psych' if defined?(YAML::ENGINE)

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name         = %q{xapian-ruby}
  s.version      = "1.2.20"
  s.authors      = ["Gernot Kogler"]
  s.summary      = %q{xapian libraries and ruby bindings}
  s.email        = %q{gernot.kogler (at) garaio (dot) com}
  s.homepage     = %q{https://github.com/garaio/xapian-ruby}
  s.extensions   = ["Rakefile"]
  s.required_rubygems_version = ">=1.3.6"
  s.files         = Dir.glob("xapian_source/*") + %w(LICENSE README.rdoc CHANGELOG.md Rakefile)
end
