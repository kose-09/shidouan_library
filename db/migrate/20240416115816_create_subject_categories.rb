class CreateSubjectCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :subject_categories do |t|

      t.string :name, null: false
      t.timestamps
    end
  end
end
