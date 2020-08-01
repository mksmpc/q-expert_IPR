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


Before() do |scenario|
  @scenario_name = scenario.name
  @steps_counter = 0
  db_connect
end

AfterStep do |result, step|
  @steps_counter += 1
  step_name = step.text
  puts result
  db_record_step(@scenario_name, step_name)
end

After() do |scenario|
  if scenario.failed?
    error = scenario.exception
    failed_step_name = scenario.test_steps[@steps_counter]
    db_record_step(@scenario_name, failed_step_name, error)
  end

  db_disconnect
end