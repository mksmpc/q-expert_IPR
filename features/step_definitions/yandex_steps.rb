When(/^Открыли страницу Яндекса$/) do
  visit YandexPage
end

When(/^Проверили, что присутствует форма поиска$/) do
  on YandexPage do |page|
    page.search_bar="test"
  end
end