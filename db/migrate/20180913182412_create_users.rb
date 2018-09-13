class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :username
      t.integer :password
      t.string :name
      t.integer :brunos
    end
  end
end
