class Task < ApplicationRecord
    enum status: { ongoing: 0, complete: 1 }
  end
  