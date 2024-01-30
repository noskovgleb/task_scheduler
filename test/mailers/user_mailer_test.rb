require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  setup do
    @task = tasks(:one)
  end

  test "due_date_task_notification_email" do
    mail = UserMailer.due_date_task_notification_email(@task)
    assert_equal "Due date task notification email", mail.subject
    assert_equal [@task.user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Task \"#{@task.title}\" is approaching its due time in 12 hours", mail.body.encoded
  end

  test "overdue_date_task_notification_email" do
    mail = UserMailer.overdue_date_task_notification_email(@task)
    assert_equal "Overdue date task notification email", mail.subject
    assert_equal [@task.user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Task \"#{@task.title}\" has been overdue", mail.body.encoded
  end
end
