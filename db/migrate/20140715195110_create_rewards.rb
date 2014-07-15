class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :description
      t.integer :cost
      t.integer :project_id
      t.integer :pledge_id
      t.timestamps
    end
  end
end
