When(/^Парсим ответ в JSON$/) do
  @response_json = @json_path ? (@json_path.on @response) : JSON.parse(@response)
  expect(@response_json).not_to be_nil
end

When(/^Указываем jsonPath до конечного элемента: "([^"]+)"$/) do |json_path|
  @json_path = JsonPath.new("#{json_path}")
end

Then(/^Проверяем, что в ответе присутствует поле ([^"]+)$/) do |key|
  expect(@response_json).to include(key)
end

Then(/^Проверяем, что в ответе присутствует поле "([^"]+)" со значением "([^"]*)"$/) do |key, value|
  expect(@response_json).to include(key)
  expect(@response_json[key]).to eq(value)
end

When(/^Проверяем, что в каждом элементе присутствует поле "([^"]+)" со значением "([^"]*)"$/) do |key, value|
  puts "elements count: #{@response_json.length}"
  @response_json.each do |element|
    expect(element).to include(key)
    expect(element[key]).to eq(value)
  end
end

When(/^Проверяем, что JSON пуст$/) do
  expect(@response_json).to be_empty
end