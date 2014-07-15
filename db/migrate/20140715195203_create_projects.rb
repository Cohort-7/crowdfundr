class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :goal
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
