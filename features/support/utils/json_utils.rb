# Проверяем валидность json
def json_string?(str)
  JSON.parse(str)
  true
rescue StandardError
  false
end

def json_extract_hash (json)
  if json.is_a? Hash
    json
  elsif json.is_a? Array
    json_extract_hash json[0]
  end
end