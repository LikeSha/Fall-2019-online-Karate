
Feature: OMDB API tests

  Background: setup
    * url 'http://www.omdbapi.com'

  Scenario: Verify that API key is required
    Given param t = 'Home Alone'
    When method get
    Then status 401
    And assert response.Error == 'No API key provided.'
    * print response

# status 401 means ?
# when you print only " response" , it print jason body only , not like pretty(response) ,it print header+body
# we print first ,and check info from console, we saw ERROR NO API key provided,  based on this info
#we added one line code after status 401 :   And assert response.Error == 'No API key provided.'

  Scenario: Verify movie info
    Given param t = 'Karate'
    And param apiKey = '9f94d4d0'
    When method get
    * print karate.pretty(response)
    Then status 200
    And match response contains {Title: 'Karate'}



