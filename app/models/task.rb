class Task < ApplicationRecord
  belongs_to :user

  enum :status, [:to_do, :in_progress, :done], default: :to_do
  enum :priority, [:low, :medium, :high], default: :medium

  validates :title, presence: true
end
