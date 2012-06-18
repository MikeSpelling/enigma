Feature: Enigma takes a string and maps it to ciphered text

  Background: Set up rotors
    Given there are 3 preset rotors
    And a preset reflector
    And an enigma

  Scenario: It should cipher a character
    Then enigma should encode "E" as "Q"
    
  Scenario: It should decipher a character
    Then enigma should encode "Q" as "E"
    
  Scenario: It should decipher a string
    Then enigma should encode "QMJIDOMZWZJFJR" as "ENIGMAREVEALED"
    
  Scenario: It should be symmetric
    Then enigma should encode "ENIGMAREVEALED" as "QMJIDOMZWZJFJR"
    