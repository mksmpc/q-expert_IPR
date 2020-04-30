When(/^Отправили (GET|POST|DELETE) запрос на ([^"]*)$/) do |rest_method, urn|
  url = Settings.petstore.host + urn
  @last_response = send_rest(rest_method, url)
end

Then(/^Проверяем, что в ответе присутствует поле "([^"]*)"$/) do |key|
  @response_json = (JSON.parse @last_response.body)
  @response_json = json_extract_hash @response_json
  expect(@response_json).to include(key)
end

Then(/^Проверяем, что в ответе присутствует поле "([^"]*)" со значением "([^"]*)"$/) do |key, value|
  step("Проверяем, что в ответе присутствует поле \"#{key}\"")
  expect(@response_json[key]).to eq(value)
end

Then(/^Проверяем статус код == ([^"]*)$/) do |status_code|
  expect(status_code.to_s).to eq(@last_response.code.to_s)
end