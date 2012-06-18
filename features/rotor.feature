Feature: Rotor takes a number as an input and maps it to another

  Background: Set up rotors
    Given there are 3 preset rotors

  Scenario: It should return the notch
    Then rotor "3" should have a notch at "21"
    And rotor "2" should have a notch at "4"
    And rotor "1" should have a notch at "nil"

  Scenario: It should map forwards
    Then rotor "3" should map "0" to "13" in "forwards" direction

  Scenario: It maps backwards
    Then rotor "1" should map "25" to "18" in "backwards" direction
    