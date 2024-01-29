require 'sidekiq-scheduler'

class DueDateNotification
  include Sidekiq::Worker

  def perform
    Task.where(due_date: (DateTime.now + 12.hours).beginning_of_minute)
        .where.not(status: :done).each do |task|
      UserMailer.due_date_task_notification_email(task).deliver_later
    end
  end
end