class GiveUsersBrunoPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bruno_points, :integer
  end
end
