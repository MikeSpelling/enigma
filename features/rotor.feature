Feature: Rotor takes a number as an input and maps it to another

  Background: Set up rotors
    Given there are 3 preset rotors

  Scenario: It should return the notch
    Then rotor "3" should have a notch at "21"
    And rotor "2" should have a notch at "4"

  Scenario: It should map forwards
    Then rotor "3" should "cipher" "A" to "N"

  Scenario: It should map backwards
    Then rotor "1" should "decipher" "Z" to "S"

  Scenario: Reflector should map a number
    Given a preset reflector
    Then the reflector should map "A" to "Y"    