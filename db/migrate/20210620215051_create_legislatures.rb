class CreateLegislatures < ActiveRecord::Migration[6.0]
  def change
    create_table :legislatures do |t|
      t.integer :legislature_code, null: false
      t.integer :year, null: false
      
      t.timestamps
    end
  end
end
