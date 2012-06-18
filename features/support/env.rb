$:.unshift(File.expand_path("enigma_machine"))

require 'enigma'
require 'rotor'
require 'test/unit'

include Test::Unit::Assertions