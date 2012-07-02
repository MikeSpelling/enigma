Given /^an enigma with rotors "([^"]*)" at offsets "([^"]*)" and reflector "([^"]*)"$/ do |rotor_choices, offsets, reflector|
  rotor_numbers = rotor_choices.split(",").map { |rotor_string| rotor_string.to_i }
  @enigma = Enigma.new(rotor_numbers, offsets.split(","), reflector.to_i)
end

Then /^enigma should encode "([^"]*)" as "([^"]*)"$/ do |input, expected_output|
  assert_equal expected_output, @enigma.cipher(input)
end

Then /^enigma should encode "([^"]*)" symmetrically$/ do |input|
  output = @enigma.cipher(input.upcase)
  @enigma.reset
  assert_equal input.upcase, @enigma.cipher(output)
end

Given /^I set the plugboard to "([^"]*)"$/ do |settings|
  @enigma.set_plugboard(settings)
end

Given /^I encode "([^"]*)"$/ do |input|
  puts @enigma.cipher(input)
end

And /^reset$/ do
  @enigma.reset
end