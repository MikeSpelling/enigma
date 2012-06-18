Given /^there are 3 preset rotors$/ do
  right3 = [
      "B", "D", "F", "H", "J", "L", "C", "P", "R", "T", "X", "V", "Z",
      "N", "Y", "E", "I", "W", "G", "A", "K", "M", "U", "S", "Q", "O"
  ]
  rotor3 = Rotor.new(right3, "V", "K")

  right2 = [
      "A", "J", "D", "K", "S", "I", "R", "U", "X", "B", "L", "H", "W",
      "T", "M", "C", "Q", "G", "Z", "N", "P", "Y", "F", "V", "O", "E"
  ]
  rotor2 = Rotor.new(right2, "E", "C")

  right1 = [
      "E", "K", "M", "F", "L", "G", "D", "Q", "V", "Z", "N", "T", "O",
      "W", "Y", "H", "X", "U", "S", "P", "A", "I", "B", "R", "C", "J"
  ]
  rotor1 = Rotor.new(right1, nil, "M")
  @rotors = {"1" => rotor1, "2" => rotor2, "3" => rotor3}
end

Then /^rotor "([^"]*)" should have a notch at "([^"]*)"$/ do |rotor_number, expected_notch|
  actual = @rotors[rotor_number].notch

  if expected_notch == "nil"
    actual.should == nil
  else
    actual.to_s.should == expected_notch
  end
end

Then /^rotor "([^"]*)" should map "([^"]*)" to "([^"]*)" in "([^"]*)" direction$/ do |rotor_number, input, expected_output, direction|
  @rotors[rotor_number].map(input.to_i, direction.to_sym).should == expected_output.to_i
end