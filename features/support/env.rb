require 'cucumber'
require 'rest-client'
require 'config'
require 'rspec/core'
require 'rspec/expectations'
require 'jsonpath'

require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'

require 'mysql2'

World(PageObject::PageFactory)

Selenium::WebDriver.logger.level = :error
Selenium::WebDriver::Chrome.driver_path = "browsers/chromedriver.exe"

env = ENV.fetch('ENV', 'LOCAL')
puts "ENV = #{env}"
Config.load_and_set_settings(Config.setting_files('config', env.downcase))
puts 'SYSTEM TIME = ' + Time.now.to_s