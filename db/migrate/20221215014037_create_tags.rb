class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      # t.string :title
      t.column :title, :string
      t.timestamps
    end

    create_table :blogs_tags do |t|
      t.column :blog_id, :integer
      t.column :tag_id, :integer
      # t.integer :blog_id
      # t.integer :tag_id
    end
  end
end
