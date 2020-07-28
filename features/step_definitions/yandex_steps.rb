When(/^Открыли страницу Яндекса$/) do
  visit YandexPage
end

When(/^Проверили, что присутствует форма поиска$/) do
  on YandexPage do |page|
    expect(page.search_bar?).to be true
  end
end