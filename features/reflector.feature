Feature: Reflector should map a set of inputs to a set of outputs

  Scenario: It maps a number
    Given a preset reflector
    Then the reflector should map "0" to "24"
    