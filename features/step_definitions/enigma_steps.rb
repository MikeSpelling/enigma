Given /^a preset reflector$/ do
  array = [24, 17, 20, 7, 16, 18, 11, 3, 15, 23, 13, 6, 14, 10, 12, 8, 4, 1, 5, 25, 2, 22, 21, 9, 0, 19]
  @reflector = Reflector.new(array)
end

Given /^an enigma$/ do
  @enigma = Enigma.new(@rotors["1"], @rotors["2"], @rotors["3"], @reflector)
end

Then /^enigma should map "([^"]*)" to "([^"]*)" in the "([^"]*)" direction$/ do |input, expected_output, direction|
  @enigma.get(input.to_i, direction.to_sym).should == expected_output.to_i
end

Then /^enigma should encode "([^"]*)" as "([^"]*)"$/ do |input, expected_output|
  @enigma.cipher(input).should == expected_output
end