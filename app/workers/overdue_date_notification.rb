require 'sidekiq-scheduler'

class OverdueDateNotification
  include Sidekiq::Worker

  def perform
    Task.where(due_date: (DateTime.now - 1.minute).beginning_of_minute)
        .where.not(status: :done).each do |task|
      UserMailer.overdue_date_task_notification_email(task).deliver_later
    end
  end
end