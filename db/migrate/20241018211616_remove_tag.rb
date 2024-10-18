class RemoveTag < ActiveRecord::Migration[7.2]
  def change
    remove_column :tasks, :tag, :integer
  end
end
