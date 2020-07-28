Before('@rest') do
  @headers_hash = Hash.new
end

Before('@UI') do |scenario|
  initialization_browser scenario
end

After('@UI') do
  screenshot
  quit_browser
end