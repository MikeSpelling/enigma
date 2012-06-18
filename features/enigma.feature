Feature: Enigma takes a string and maps it to ciphered text

  Background: Set up rotors
    Given there are 3 preset rotors
    And a preset reflector
    And an enigma

  Scenario: It maps forwards through all 3 rotors
    Then enigma should map "3" to "6" in the "forwards" direction
    
  Scenario: It maps backwards through all 3 rotors
    Then enigma should map "23" to "22" in the "backwards" direction
    
  Scenario: It should cipher a character
    Then enigma should encode "E" as "Q"
    
  Scenario: It should decipher a character
    Then enigma should encode "Q" as "E"
    
  Scenario: It should decipher a string
    Then enigma should encode "QMJIDOMZWZJFJR" as "ENIGMAREVEALED"
    
  Scenario: It should be symmetric
    Then enigma should encode "ENIGMAREVEALED" as "QMJIDOMZWZJFJR"
    