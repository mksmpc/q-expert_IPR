class YandexPage
  include PageObject

  page_url 'https://ya.ru'

  text_field(:search_bar, id: "text")

end
