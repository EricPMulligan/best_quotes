require 'sqlite3'
require 'rulers/sqlite_model'

class MyTable < Rulers::Model::SQLite
  def method_missing(name, *args, &block)
    method = name.to_s
    if self.class.schema.has_key?(method)
      self.class.instance_eval do
        define_method(method) { @hash[method] }
      end
      self.send(method)
    end
  end
end
STDERR.puts MyTable.schema.inspect

# Create row
mt = MyTable.create 'title' => 'I saw it again!', 'posted' => 1, 'body' => 'What?'
mt['title'] = 'I really did!'
mt.save!

mt2 = MyTable.find mt.id

puts "Title: #{mt2.title}"

puts "Count: #{MyTable.count}"

top_id = mt.id.to_i
(1..top_id).each do |id|
  mt_id = MyTable.find(id)
  puts "Found title #{mt_id.title}."
end
