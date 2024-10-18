class Task < ApplicationRecord
  enum status: { ongoing: 0, complete: 1 }

  validates :status, presence: true, inclusion: { in: statuses.keys }
end
