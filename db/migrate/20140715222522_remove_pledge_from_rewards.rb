class RemovePledgeFromRewards < ActiveRecord::Migration
  def change
  	remove_column :rewards, :pledge_id, :integer
  end
end
