def db_connect
  @connection = Mysql2::Client.new(:host     => "localhost",
                                   :username => "root",
                                   :password => "12345",
                                   :database => "cucumber")
end

def db_disconnect
  @connection.close
end

def db_record_step(scenario, step, error = nil)
  error_block = error ? "'fail', '#{error}'" : "'pass', NULL"
  values      = "now(), '#{scenario}', '#{step}', #{error_block}"
  table       = "log_time, scenario, step, status, error"

  @connection.query("INSERT INTO AutotestLog (#{table}) VALUES (#{values});")
end