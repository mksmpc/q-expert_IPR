When(/^Отправили (GET|POST|DELETE|PUT) на ([^"]*)$/) do |rest_method, urn|
  url       = Settings.petstore.host + urn
  @response = send_rest(rest_method, url, headers: @headers_hash, payload: @payload)
end

When(/^Добавили в Headers:$/) do |table|
  table.hashes.each do |hash|
    h = {hash[:key] => hash[:value]}
    @headers_hash.merge!(h)
  end
end

Then(/^Проверяем статус код == ([^"]*)$/) do |status_code|
  expect(status_code.to_s).to eq(@response.code.to_s)
end

When(/^Проверяем, что ответ пуст$/) do
  expect(@response.body).to be_empty
end

When(/^Указали содержимое файла (.*) в качестве тела запроса$/) do |file_path|
  @payload = File.read("files/#{file_path}")
end

When(/^Сравнили сгенерированные данные с данными с сервера$/) do
  expect(@generated_data).to eq(JSON.parse(@response.body, :symbolize_names => true))
end