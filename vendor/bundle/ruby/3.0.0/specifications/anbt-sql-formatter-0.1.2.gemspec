# -*- encoding: utf-8 -*-
# stub: anbt-sql-formatter 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "anbt-sql-formatter".freeze
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["sonota88".freeze]
  s.date = "2025-01-26"
  s.description = "A tool for SQL formatting written in Ruby. Ruby port of Blanco SQL Formatter.".freeze
  s.email = ["yosiot8753@gmail.com".freeze]
  s.executables = ["anbt-sql-formatter".freeze]
  s.files = ["bin/anbt-sql-formatter".freeze]
  s.homepage = "https://github.com/sonota88/anbt-sql-formatter".freeze
  s.rubygems_version = "3.2.33".freeze
  s.summary = "A tool for SQL formatting written in Ruby.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.6.2"])
  else
    s.add_dependency(%q<test-unit>.freeze, ["~> 3.6.2"])
  end
end
