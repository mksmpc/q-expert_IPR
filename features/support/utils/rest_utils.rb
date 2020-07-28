def send_rest(method, url, headers: nil, payload: nil)
  log_request_params(method: method, url: url, headers: headers, payload: payload)

  response = nil
  RestClient::Request.execute(method: method, url: url, headers: headers, payload: payload) do |r|
    response = r
  end

  log_response_params response
  response
end

# Принимает любой объект и выводит его в консоль
def log_request_params(args)
  puts 'log_request_params =====>'
  puts args
  puts '<====='
end

# Форматированный вывод ответа на REST запрос
def log_response_params(response)
  puts "log_response_params: #{response.request.url} =======>"
  puts "response_code: #{response.code}"
  puts "response_headers: #{response.headers}"
  puts "response_body: #{response.body}"
  puts '<====='
end