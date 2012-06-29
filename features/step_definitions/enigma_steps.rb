Then /^an enigma with rotors "([^"]*)" and reflector "([^"]*)"$/ do |rotor_choices, reflector|
  rotor_numbers = rotor_choices.split(", ").map{|rotor_string| rotor_string.to_i}
  @enigma = Enigma.new(rotor_numbers, reflector.to_i)
end

Then /^enigma should encode "([^"]*)" as "([^"]*)"$/ do |input, expected_output|
  assert_equal expected_output, @enigma.cipher(input)
end

Then /^enigma should encode "([^"]*)" symettrically$/ do |input|
  output = @enigma.cipher(input.upcase)
  steps "Given an enigma with rotors \"1, 2, 3\" and reflector \"1\""
  assert_equal input.upcase, @enigma.cipher(output)
end