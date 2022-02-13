# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_smtp_test/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_smtp_test"
  spec.version       = SimpleSmtpTest::VERSION
  spec.authors       = ["Winston Kotzan"]
  spec.email         = ["wak@wakproductions.com"]
  spec.description   = %q{A simple gem for testing your Rails outgoing mail settings.}
  spec.summary       = %q{Run the rake task simple_smtp_test['email@example.com'] and it will send a test email to that address.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", ">= 2.2.23"
  spec.add_dependency "rake"
  spec.add_dependency "rails", ">= 4.0"
  spec.add_dependency "actionmailer", ">= 4.0"
end
