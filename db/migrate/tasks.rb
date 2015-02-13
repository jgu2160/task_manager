require 'sequel'

database_1 = Sequel.sqlite('db/task_manager_test.sqlite3')
database_2 = Sequel.sqlite('db/task_manager_dev.sqlite3')

[database_1, database_2].each do |database|
  database.create_table :tasks do
    primary_key :id
    String :title
    Text :description
  end
end
