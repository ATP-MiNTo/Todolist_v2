class Task < ApplicationRecord
  enum status: { ongoing: 0, complete: 1 }
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :catego, presence: true
  belongs_to :catego
  def toggle_status
    self.status = ongoing? ? :complete : :ongoing
    save
  end
end
