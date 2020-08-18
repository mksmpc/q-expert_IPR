def table_to_hash(table)
  hash = {}
  table.hashes.each do |row|
    hash[row['key'].to_sym] = row['value']
  end
  hash
end
