# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/due_date_task_notification_email
  def due_date_task_notification_email
    UserMailer.due_date_task_notification_email
  end

end
