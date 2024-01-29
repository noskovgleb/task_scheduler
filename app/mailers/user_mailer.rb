class UserMailer < ApplicationMailer
  def due_date_task_notification_email(task)
    @task = task

    mail to: "#{task.user.email}"
  end

  def overdue_date_task_notification_email(task)
    @task = task

    mail to: "#{task.user.email}"
  end
end
