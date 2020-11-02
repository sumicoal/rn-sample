class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.date :date
      t.string :name
      t.boolean :check_flag

      t.timestamps
    end
  end
end
