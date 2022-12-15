class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.column :username, :string
      t.column :password, :string
      # Example: t.column "first_name", :string :password
      t.timestamps
    end
  end
end
