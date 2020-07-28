# encoding: UTF-8
# language: ru

@rest
Функционал: Создание заказа на животное

  Предыстория:
    Допустим Добавили в Headers:
      | key          | value            |
      | Content-Type | application/json |

  Структура сценария: Создание заказа на животное и проверка ответа
    Допустим Указали содержимое файла order/<file> в качестве тела запроса
    И Отправили POST на /store/order
    Тогда Проверяем статус код == <status_code>
    И Парсим ответ в JSON
    И Проверяем, что в ответе присутствует поле "<key>" со значением "<value>"
    @HP
    Примеры:
      | file            | status_code | key    | value  |
      | good_order.json | 200         | status | placed |
    @BP
    Примеры:
      | file           | status_code | key     | value                  |
      | bad_order.json | 500         | message | something bad happened |
