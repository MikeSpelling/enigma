Then /^the reflector should map "([^"]*)" to "([^"]*)"$/ do |input, expected_output|
  @reflector.get(input.to_i).should == expected_output.to_i
end