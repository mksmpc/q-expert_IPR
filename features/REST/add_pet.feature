# encoding: UTF-8
# language: ru

@rest
Функционал: Добавление животного

  Предыстория:
    Допустим Добавили в Headers:
      | key          | value            |
      | Content-Type | application/json |

  Структура сценария: Добавление животного и проверка статусов
    Допустим Сгенерировали данные животного с параметрами
      | key    | value   |
      | status | <value> |
    И Отправили POST на /pet
    Тогда Проверяем статус код == <status_code>
    И Парсим ответ в JSON
    И Проверяем, что в ответе присутствует поле "<key>" со значением "<value>"
    @HP
    Примеры:
      | status_code | key    | value     |
      | 200         | status | available |
      | 200         | status | pending   |
      | 200         | status | sold      |

Сценарий: Проверка всех полей созданного животного
  Допустим Сгенерировали данные животного
  И Отправили POST на /pet
  И Запомнили ID животного из ответа
  И Добавили ID животного в сгенерированные данные
  И Получили животного по ID
  Тогда Сравнили сгенерированные данные с данными с сервера