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