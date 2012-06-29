Feature: Enigma takes a string and maps it to ciphered text

  Background: Set up rotors
    Given an enigma with rotors "1, 2, 3" and reflector "1"

  Scenario: It should cipher a character
    Then enigma should encode "E" as "Q"
    
  Scenario: It should decipher a character
    Then enigma should encode "Q" as "E"
    
  Scenario: It should decipher a string
    Then enigma should encode "QMJIDOMZWZJFJR" as "ENIGMAREVEALED"
    
  Scenario: It should be symmetric
    Then enigma should encode "abcdefeghijklmnopqrstuvwxyz" symettrically
    