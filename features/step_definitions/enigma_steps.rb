Given /^an enigma$/ do
  @enigma = Enigma.new(@rotors["1"], @rotors["2"], @rotors["3"], @reflector)
end

Then /^enigma should encode "([^"]*)" as "([^"]*)"$/ do |input, expected_output|
  assert_equal @enigma.cipher(input), expected_output
end