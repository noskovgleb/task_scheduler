require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "task title must be present" do
    task = Task.new(title: nil)
    assert_not task.valid?, "Task title can't be blank"
  end

  test "task status defaults to :to_do" do
    task = Task.new
    assert_equal 'to_do', task.status
  end

  test "task priority defaults to :medium" do
    task = Task.new
    assert_equal 'medium', task.priority
  end

  test "task status can be set to :in_progress" do
    task = Task.new(status: :in_progress)
    assert_equal 'in_progress', task.status
  end

  test "task priority can be set to :high" do
    task = Task.new(priority: :high)
    assert_equal 'high', task.priority
  end
end
