Given(/^I have a test instance$/) do
	@instance  = 'https://dashmaster-ops12-13-0-0.coupadev.com/api/'
	@headers = {'X_COUPA_API_KEY' => '78cc3f84b3775bed481ffac587f573f9aa32b3ad', 'Accept' => 'application/xml'}
end

When(/^I send GET request for "([^"]*)"$/) do |resource|
	@response = RestClient.get @instance+resource, @headers
	expect(@response.code).to eq(200)
end

When(/^I send POST request for "([^"]*)"$/) do |resource|
	@response = RestClient.post @instance+resource, @payload, @headers
	expect(@response.code).to eq(201)
end

Then(/^I retrieve all the "([^"]*)" in the response$/) do |resource|
	@resources = []
	xml_doc = Nokogiri::XML(@response)
	xml_doc.xpath("//account/name").each do |account|
		@resources << account.text
	end
end

Then(/^I should see following "([^"]*)" in the response$/) do |resource, table|
	accoutns = []
	table.hashes.each do |hash|
 		accoutns << hash['account']
 	end
 	accoutns.each do |account|
 		expect(@resources).to include(account)
 	end
end

Given(/^I have payload "([^"]*)" for "([^"]*)"$/) do |payload, resource|
	@payload = update_tokens("payloads/#{resource}/#{payload}")
end



