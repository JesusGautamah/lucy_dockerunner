# frozen_string_literal: true

require_relative "lib/lucy_dockerunner/version"

Gem::Specification.new do |spec|
  spec.name = "lucy_dockerunner"
  spec.version = LucyDockerunner::VERSION
  spec.authors = ["JesusGautamah"]
  spec.email = ["lima.jesuscc@gmail.com"]
  spec.summary = "This gem is a tool to run docker containers with rake commands, good for CI/CD and Rails projects"
  spec.description = "This gem is a tool to run docker containers with rake commands, good for CI/CD and Rails projects. 
  It's a wrapper for docker-compose commands and original code was developed 
  by me in the project https://github.com/JesusGautamah/outerspace-blockchain"
  spec.homepage = "https://github.com/JesusGautamah/lucy_dockerunner"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "rake-hooks"
end
