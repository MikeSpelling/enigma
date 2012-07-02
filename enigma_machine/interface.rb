#!/usr/bin/env ruby
require './enigma_machine/enigma'
require './enigma_machine/rotor'

puts "Enter comma seperated rotor positions (1 to 8)"
rotors = gets.chomp.split(",").map{|str|str.to_i}

puts "Enter comma seperated offset positions for each rotor, in the same order"
offsets = gets.chomp.split ","

puts "Enter reflector number (1 to 5)"
reflector = gets.chomp.to_i

puts "Enter plugboard settings in form A-B,C-D"
plugboard = gets.chomp

enigma = Enigma.new(rotors, offsets, reflector, plugboard)

puts "Enter string to encrypt"
input = gets.chomp

puts enigma.cipher(input)