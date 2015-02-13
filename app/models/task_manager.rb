class TaskManager
  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/task_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/task_manager_dev.sqlite3")
    end
  end

  def self.task_table
    @database[:tasks]
  end

  def self.create(task)
    task = task.each_with_object({}){|(k,v), h| h[k.to_sym] = v}
    task_table.insert(task)
  end

  def self.all
    task_table.select.to_a
  end

  def self.find(id)
    Task.new(task_table.where(id: id).first)
  end

  def self.update(id, task)
    task = task.each_with_object({}){|(k,v), h| h[k.to_sym] = v}
    task_table.where(id: id).update(title: task[:title], description: task[:description])
  end

  def self.delete(id)
    task_table.where(id: id).delete
  end

  def self.delete_all
    task_table.delete
  end
end
