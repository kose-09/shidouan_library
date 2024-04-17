class CreateUnitCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :unit_categories do |t|
      
      t.string :unit
      t.references :subject_category, foreign_key: true

      t.timestamps
    end
  end
end
