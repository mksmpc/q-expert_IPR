def initialization_browser(scenario)
  @caps = Selenium::WebDriver::Remote::Capabilities.chrome(Settings.caps)
  @browser = Selenium::WebDriver.for(:chrome, desired_capabilities: @caps)
  @browser.manage.window.maximize
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