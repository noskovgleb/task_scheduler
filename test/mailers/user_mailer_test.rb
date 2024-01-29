require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "due_date_task_notification_email" do
    mail = UserMailer.due_date_task_notification_email
    assert_equal "Due date task notification email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
