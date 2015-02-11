require_relative '../test_helper'

class TaskManagerTest < ModelTest
  def test_it_creates_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description",
                         :id          => 1 })
    task = TaskManager.find(1)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def test_it_creates_3_tasks
  	make_3_tasks
  	assert_equal 3, TaskManager.all.count
  end

  def make_3_tasks
  	3.times do |i|
  		TaskManager.create({ :title       => "a title",
	                         :description => "a description",
	                         :id          => i })
  	end
  end

  def test_it_finds_correct_task
  	make_3_tasks
  	assert_equal 3, TaskManager.find(3).id
	end

	def test_it_deletes_one
		make_3_tasks
		TaskManager.delete(3)
		assert_equal 2, TaskManager.all.count
	end

	def test_it_deletes_all
		make_3_tasks
  	assert_equal 3, TaskManager.all.count
  	assert_equal 0, TaskManager.delete_all
	end

	def test_it_updates
		make_3_tasks
    TaskManager.update(3, {title: "moo", description: "milkbar"})
    assert_equal "milkbar", TaskManager.find(3).description
	end
end
