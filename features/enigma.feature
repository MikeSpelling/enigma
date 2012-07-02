Feature: Enigma takes a string and maps it to ciphered text

  Scenario: It should cipher a character
    Given an enigma with rotors "1, 2, 3" at offsets "M, C, K" and reflector "1"
    Then enigma should encode "E" as "Q"

  Scenario: It should decipher a character
    Given an enigma with rotors "1, 2, 3" at offsets "M, C, K" and reflector "1"
    Then enigma should encode "Q" as "E"

  Scenario: It should decipher a string
    Given an enigma with rotors "1, 2, 3" at offsets "M, C, K" and reflector "1"
    Then enigma should encode "QMJIDOMZWZJFJR" as "ENIGMAREVEALED"

  Scenario: It should be symmetric
    Given an enigma with rotors "1, 2, 3" at offsets "M, C, K" and reflector "1"
    Then enigma should encode "abcdefeghijklmnopqrstuvwxyz" symmetrically
    
  Scenario: It is still symmetric with different settings and plugboard
    Given an enigma with rotors "2, 3, 1" at offsets "X, D, L" and reflector "1"
    And I set the plugboard to "A-X,F-Y,G-E,J-L,Q-W,Z-S,B-C"
    Then enigma should encode "abcdefeghijklmnopqrstuvwxyz" symmetrically
    
  Scenario: The new rotors keep symmetry
    Given an enigma with rotors "4, 5, 8, 7, 6" at offsets "Y, X, A, F, D" and reflector "1"
    Then enigma should encode "abcdefeghijklmnopqrstuvwxyz" symmetrically
    
 Scenario: The new reflector keeps symmetry
    Given an enigma with rotors "1, 2, 3" at offsets "A, B, C" and reflector "2"
    Then enigma should encode "abcdefeghijklmnopqrstuvwxyz" symmetrically

  Scenario: Encode something complex
    Given an enigma with rotors "4, 1, 5, 3, 2, 8, 7, 6" at offsets "I, L, R, D, Z, C, E, Y" and reflector "3"
    And I set the plugboard to "A-X,C-D,G-R,M-I,P-O,Z-V,H-S,B-Q"
    Then enigma should encode "abcdefeghijklmnopqrstuvwxyzabcdefeghijklmnopqrstuvwxyz" symmetrically
    When reset
    Then I encode "Hello world!"