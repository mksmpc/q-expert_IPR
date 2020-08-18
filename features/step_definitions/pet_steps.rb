When(/^Создали животное с id = (\d+)$/) do |id|
  @headers_hash.merge!({"Content-Type" => "application/json"})
  @payload = JSON.generate({id: "#{id}"})
  step("Отправили POST на /pet")
end

When(/^Создали заказ с id = (\d+)$/) do |id|
  @headers_hash.merge!({"Content-Type" => "application/json"})
  @payload = JSON.generate({id: "#{id}"})
  step 'Отправили POST на /store/order'
end

When(/^Сгенерировали данные животного с параметрами$/) do |table|
  params          = table_to_hash table
  @generated_data = generate_random_pet params
  puts "Generate animal: #{@generated_data} \r\n with params: #{params}"
end


When(/^Сгенерировали данные животного$/) do
  @generated_data = generate_random_pet
  puts "Generate animal: #{@generated_data}"
end

When(/^Сохранили ID животного из ответа$/) do
  @pet_id = JSON.parse(@response.body)['id']
  puts "Save pet ID: #{@pet_id}"
end

When(/^Получили животного по сохраненному ID$/) do
  @payload = nil
  puts "Get animal by ID: #{@pet_id}"
  step "Отправили GET на /pet/#{@pet_id}"
end

When(/^Добавили ID животного в сгенерированные данные$/) do
  @generated_data.merge!({id: @pet_id})
  puts "Merge ID #{@pet_id} into\r\n #{@generated_data}"
end

When(/^Создали случайное животное$/) do
  step 'Сгенерировали данные животного'
  step 'Добавили сгенерированные данные в тело запроса'
  step 'Отправили POST на /pet'
end

When(/^Сохранили данные животного в переменную (.+)$/) do |variable_name|
  puts "Save into: #{variable_name} \r\n #{@generated_data}"
  @variables[variable_name] = @generated_data
end

When(/^Проверили, что данные животного из переменной ([^\s]+) и ответ с сервера отличаются$/) do |variable_name|
  puts "Compare data from #{variable_name} with response"
  json_response = JSON.parse(@response.body, :symbolize_names => true)

  expect(@variables[variable_name]).not_to eq(json_response.reject { |k| k == :id })
end