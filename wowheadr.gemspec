# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wowheadr/version"

Gem::Specification.new do |s|
  s.name        = "wowheadr"
  s.version     = Wowheadr::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brandon Tilley"]
  s.email       = ["binarymuse@binarymuse.net"]
  s.homepage    = "https://github.com/BinaryMuse/wowhead"
  s.summary     = "wowheadr #{Wowheadr::VERSION}"
  s.description = "Leverage the power of Wowhead for your Ruby projects."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
