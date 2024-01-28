class Task < ApplicationRecord
  enum :status, [:to_do, :in_progress, :done], default: :to_do
  enum :priority, [:low, :medium, :high], default: :medium

  validates :title, presence: true
  # validates :due_date, presence: true, comparison: { greater_than: Time.now, message: 'must be in the future'}
end
