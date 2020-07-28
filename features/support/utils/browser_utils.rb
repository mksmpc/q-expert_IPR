def initialization_browser(scenario)
  @caps = Selenium::WebDriver::Remote::Capabilities.chrome(Settings.caps)
  @browser = Selenium::WebDriver.for(:chrome, desired_capabilities: @caps)
  @browser.manage.window.maximize
  setup_browser_timeouts
end


def setup_browser_timeouts
  timeout = Settings.timeouts
  @browser.manage.timeouts.implicit_wait = timeout.implicit_wait
  @browser.manage.timeouts.script_timeout = timeout.script_timeout
  @browser.manage.timeouts.page_load = timeout.page_load
  @wait = Selenium::WebDriver::Wait.new(timeout: timeout.page_load)
end

def screenshot
  time = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
  filename = 'report_files/' + "#{time}.png"
  @browser.save_screenshot(filename)
  embed(filename, 'image/png')
end

def quit_browser
  @browser.quit
end