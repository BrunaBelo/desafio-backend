class CreateQuotaTypeSpecification < ActiveRecord::Migration[6.0]
  def change
    create_table :quota_type_specifications do |t|
      t.string :description
      t.integer :number
      t.belongs_to :quota_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
