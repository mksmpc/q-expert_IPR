# encoding: UTF-8
# language: ru

@rest
Функционал: Обновление информации по животному

  Предыстория:
    Допустим Добавили в Headers:
      | key          | value            |
      | Content-Type | application/json |

    #TODO: Создать животное; обновить его и сравнить изменения
  Структура сценария: Обновление информации животного и проверка ответа
    Допустим Указали содержимое файла update_pet/update_pet_<file> в качестве тела запроса
    И Отправили PUT на /pet
    Тогда Проверяем статус код == <status_code>
    И Парсим ответ в JSON
    И Проверяем, что в ответе присутствует поле "<key>" со значением "<value>"
    @HP
    Примеры:
      | file      | status_code | key    | value     |
      | good.json | 200         | status | available |
    @BP
    Примеры:
      | file     | status_code | key     | value                  |
      | bad.json | 500         | message | something bad happened |