Feature: Working with accounts API
	Background: 
		Given I have a test instance

	Scenario: GET all the accounts
		When I send GET request for "accounts"
		Then I retrieve all the "accounts" in the response
		Then I should see following "accounts" in the response
			| account | 
      |	HQ - Marketing, Assets |
      |	HQ - Finance, Indirect |
      |	HQ - Finance, Assets |
      |	HQ - IT, Indirect |

  Scenario: Create an Account
  	Given I have payload "new_account.xml.erb" for "accounts"
  	When I send POST request for "accounts"

			

