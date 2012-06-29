Given /^an enigma with rotors "([^"]*)" at offsets "([^"]*)" and reflector "([^"]*)"$/ do |rotor_choices, offsets, reflector|
  rotor_numbers = rotor_choices.split(", ").map{|rotor_string| rotor_string.to_i}
  @enigma = Enigma.new(rotor_numbers, offsets.split(", "), reflector.to_i)
end

Then /^enigma should encode "([^"]*)" as "([^"]*)"$/ do |input, expected_output|
  assert_equal expected_output, @enigma.cipher(input)
end

Then /^enigma should encode "([^"]*)" symettrically$/ do |input|
  output = @enigma.cipher(input.upcase)
  steps "Given an enigma with rotors \"1, 2, 3\" at offsets \"M, C, K\" and reflector \"1\""
  steps "And I rearrange the plugboard to a preset"
  assert_equal input.upcase, @enigma.cipher(output)
end

Given /^I rearrange the plugboard to a preset$/ do
  # Random choice of changes
  @enigma.plugboard = {"A"=>"B", "B"=>"A", "C"=>"Z", "D"=>"S", "E"=>"P", "F"=>"G", "G"=>"F", "H"=>"H", "I"=>"K", "J"=>"M", "K"=>"I", "L"=>"X", "M"=>"J",
  "N"=>"R", "O"=>"O", "P"=>"E", "Q"=>"Q", "R"=>"N", "S"=>"D", "T"=>"T", "U"=>"Y", "V"=>"V", "W"=>"W", "X"=>"L", "Y"=>"U", "Z"=>"C"}
end

Given /^I set the plugboard to "([^"]*)"$/ do |settings|
  plugboard = {"A"=>"A", "B"=>"B", "C"=>"C", "D"=>"D", "E"=>"E", "F"=>"F", "G"=>"G", "H"=>"H", "I"=>"I", "J"=>"J", "K"=>"K", "L"=>"L", "M"=>"M",
    "N"=>"N", "O"=>"O", "P"=>"P", "Q"=>"Q", "R"=>"R", "S"=>"S", "T"=>"T", "U"=>"U", "V"=>"V", "W"=>"W", "X"=>"X", "Y"=>"Y", "Z"=>"Z"}
    
  settings.split(",").each do |pair|
    chars = pair.split("-")
    plugboard[chars[0].upcase] = chars[1].upcase
    plugboard[chars[1].upcase] = chars[0].upcase
  end
  @enigma.plugboard = plugboard
end

Given /^I encode "([^"]*)"$/ do |input|
  puts @enigma.cipher(input)
end