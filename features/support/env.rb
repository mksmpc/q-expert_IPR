require 'selenium-webdriver'
require 'cucumber'
require 'rest-client'
require 'config'
require 'rspec/core'
require 'rspec/expectations'
require "rspec/json_expectations"

Selenium::WebDriver.logger.level = :error

env = ENV.fetch('ENV', 'LOCAL')
puts "ENV = #{env}"
Config.load_and_set_settings(Config.setting_files('config', env.downcase))
puts 'SYSTEM TIME = ' + Time.now.to_s