Given /^an enigma$/ do
  @enigma = Enigma.new(@rotors["1"], @rotors["2"], @rotors["3"], @reflector)
end

Then /^enigma should encode "([^"]*)" as "([^"]*)"$/ do |input, expected_output|
  @enigma.cipher(input).should == expected_output
end