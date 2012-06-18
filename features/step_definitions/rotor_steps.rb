Given /^there are 3 preset rotors$/ do
  rotor3 = Rotor.new("BDFHJLCPRTXVZNYEIWGAKMUSQO", "V", "K")
  rotor2 = Rotor.new("AJDKSIRUXBLHWTMCQGZNPYFVOE", "E", "C")
  rotor1 = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", "Q", "M")
  @rotors = {"1" => rotor1, "2" => rotor2, "3" => rotor3}
end

Given /^a preset reflector$/ do
  @reflector = Rotor.new("YRUHQSLDPXNGOKMIEBFZCWVJAT")
end

Then /^rotor "([^"]*)" should have a notch at "([^"]*)"$/ do |rotor_number, expected_notch|
  actual = @rotors[rotor_number].notch

  if expected_notch == "nil"
    actual.should == nil
  else
    actual.to_s.should == expected_notch
  end
end

Then /^rotor "([^"]*)" should "([^"]*)" "([^"]*)" to "([^"]*)"$/ do |rotor_number, direction, input, expected_output|
  if direction == "cipher"
    @rotors[rotor_number].cipher(input.to_i).should == expected_output.to_i
  elsif direction == "decipher"
    @rotors[rotor_number].decipher(input.to_i).should == expected_output.to_i
  end
end

Then /^the reflector should map "([^"]*)" to "([^"]*)"$/ do |input, expected_output|
  @reflector.cipher(input.to_i).should == expected_output.to_i
end