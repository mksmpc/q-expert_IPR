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
  params   = table_to_hash table
  pet_data = generate_random_pet params
  @payload = JSON.generate(pet_data)
end
