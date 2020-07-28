# encoding: UTF-8
# language: ru

@rest
Функционал: Добавление животного

  Предыстория:
    Допустим Добавили в Headers:
      | key          | value            |
      | Content-Type | application/json |

  Структура сценария: Добавление животного и проверка ответа
    Допустим Указали содержимое файла add_pet/add_pet_<file> в качестве тела запроса
    И Отправили POST на /pet
    Тогда Проверяем статус код == <status_code>
    И Парсим ответ в JSON
    И Проверяем, что в ответе присутствует поле "<key>" со значением "<value>"
    @HP
    Примеры:
      | file           | status_code | key    | value     |
      | available.json | 200         | status | available |
      | pending.json   | 200         | status | pending   |
      | sold.json      | 200         | status | sold      |
    @BP
    Примеры:
      | file           | status_code | key     | value     |
      | bad_input.json | 400         | message | bad input |
      | blank.json     | 405         | message | no data   |