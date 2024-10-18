class AddCategoIdToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :catego_id, :integer
  end
end
