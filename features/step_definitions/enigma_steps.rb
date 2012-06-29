Given /^an enigma$/ do
  @enigma = Enigma.new(@rotors, @reflector)
end

Then /^enigma should encode "([^"]*)" as "([^"]*)"$/ do |input, expected_output|
  assert_equal expected_output, @enigma.cipher(input)
end