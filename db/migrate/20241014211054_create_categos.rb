class CreateCategos < ActiveRecord::Migration[7.2]
  def change
    create_table :categos do |t|
      t.string :name

      t.timestamps
    end
  end
end
