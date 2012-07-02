Feature: Enigma takes a string and maps it to ciphered text

  Background: Set up rotors
    Given an enigma with rotors "1, 2, 3" at offsets "M, C, K" and reflector "1"

  Scenario: It should cipher a character
    Then enigma should encode "E" as "Q"

  Scenario: It should decipher a character
    Then enigma should encode "Q" as "E"

  Scenario: It should decipher a string
    Then enigma should encode "QMJIDOMZWZJFJR" as "ENIGMAREVEALED"

  Scenario: It should be symmetric
    Given I set the plugboard to "A-B,C-F,G-R,M-I,P-O,Z-V,H-S,L-Q"
    Then enigma should encode "abcdefeghijklmnopqrstuvwxyz" symmetrically
    
  Scenario: More complicated enigma
    Given an enigma with rotors "3, 2, 5, 4, 1" at offsets "Y, S, Z, A, J" and reflector "4"
    And I set the plugboard to "G-A,Z-F,Q-X,J-K"
    Then enigma should encode "ALONGSENTANCE" symmetrically

  Scenario: Encode something
    Given an enigma with rotors "4, 1, 5, 3, 2" at offsets "A, L, R, D, Z" and reflector "3"
    And I set the plugboard to "A-X,C-D,G-R,M-I,P-O,Z-V,H-S,B-Q"
    Then I encode "HELLOWORLD"