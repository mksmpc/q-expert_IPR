When(/^Создали животное с id = (\d+)$/) do |id|
  @headers_hash.merge!({"Content-Type" => "application/json"})
  @payload = JSON.generate({id: "#{id}"})
  step("Отправили POST на /pet")
end

When(/^Создали заказ с id = (\d+)$/) do |id|
  @headers_hash.merge!({"Content-Type" => "application/json"})
  @payload = JSON.generate({id: "#{id}"})
  step("Отправили POST на /store/order")
end

When(/^Сгенерировали данные животного с параметрами$/) do |table|
  params          = table_to_hash table
  @generated_data = generate_random_pet params
  @payload        = JSON.generate(@generated_data)
end


When(/^Сгенерировали данные животного$/) do
  @generated_data = generate_random_pet
  @payload        = JSON.generate(@generated_data)
end

When(/^Запомнили ID животного из ответа$/) do
  @pet_id = JSON.parse(@response.body)['id']
  puts "pet ID: #{@pet_id}"
end

When(/^Получили животного по ID$/) do
  step("Отправили GET на /pet/#{@pet_id}")
end

When(/^Добавили ID животного в сгенерированные данные$/) do
  @generated_data.merge!({id: @pet_id})
end