class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :title, null: false
      t.text :caption
      t.references :subject_category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
