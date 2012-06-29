Given /^there are 3 preset rotors$/ do
  rotor3 = Rotor.new("BDFHJLCPRTXVZNYEIWGAKMUSQO", "V", "K")
  rotor2 = Rotor.new("AJDKSIRUXBLHWTMCQGZNPYFVOE", "E", "C")
  rotor1 = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", "Q", "M")
  @rotors = [rotor1, rotor2, rotor3]
end

Given /^a preset reflector$/ do
  @reflector = Rotor.new("YRUHQSLDPXNGOKMIEBFZCWVJAT")
end

Then /^rotor "([^"]*)" should have a notch at "([^"]*)"$/ do |rotor_number, expected_notch|
  actual = @rotors[rotor_number.to_i-1].notch

  if expected_notch == "nil"
    assert_equal actual, nil
  else
    assert_equal expected_notch, actual.to_s
  end
end

Then /^rotor "([^"]*)" should "([^"]*)" "([^"]*)" to "([^"]*)"$/ do |rotor_number, direction, input, expected_output|
  if direction == "cipher"
    assert_equal expected_output, @rotors[rotor_number.to_i-1].cipher(input)
  elsif direction == "decipher"
    assert_equal expected_output, @rotors[rotor_number.to_i-1].decipher(input)
  end
end

Then /^the reflector should map "([^"]*)" to "([^"]*)"$/ do |input, expected_output|
  assert_equal expected_output, @reflector.cipher(input)
end