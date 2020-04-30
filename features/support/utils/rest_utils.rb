def send_rest(method, url, headers: nil, payload: nil)
  log_request_params(method: method, url: url, headers: headers, payload: payload)

  response = nil
  RestClient::Request.execute(method: method, url: url, headers: headers, payload: payload) { |r| response = r }

  log_response_params response
  response
end

# Принимает любой объект и выводит его в консоль
#
# В данном случае из параметров генерируется хеш объект:
# >> log_request_params(method: method, url: url, headers: headers, payload: payload)
def log_request_params(args)
  puts args
end

# Форматированный вывод ответа на REST запрос
def log_response_params(response)
  body = response.body
  puts "response_code: #{response.code} "
  puts "response_headers: #{response.headers} "
  parsed = body && body.length >= 2 && (json_string? body) ? JSON.parse(body) : {}
  puts "response_body: #{JSON.parse(parsed.to_json)} "
end