Feature: Test Karate DSL methods GET

  Background:
    * url 'https://reqres.in/api/users'

  Scenario: Obtains all list of first names

    Given param page = 1
    When method get
    Then status 200
#    * def testDef = get $.data[*].first_name
#    Then print testDef
    And match $.data[*].first_name contains ['Janet', 'George']

  Scenario: Obtain number of page request

    Given param page = 2
    When method get
    Then status 200
    And match $.page == 2

    Scenario: Obtain length all request

      Given param page = 1
      When method get
      Then status 200
      * def map = karate.toBean(, 'java.util.HashMap')
      * def count = map.size()
      And match count == 6
