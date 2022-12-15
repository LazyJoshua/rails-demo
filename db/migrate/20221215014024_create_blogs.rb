class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.column :title, :string
      t.column :content, :text
      t.column :is_public, :boolean, default: true
      # Example: t.column "first_name", :string
      # t.boolean :is_public, default: true
      t.belongs_to :user
      t.timestamps
    end
  end
end
