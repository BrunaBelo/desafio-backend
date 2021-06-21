class CreateQuotaTypeSpecifications < ActiveRecord::Migration[6.0]
  def change
    create_table :quota_type_specifications do |t|
      t.string :description
      t.integer :number

      t.timestamps
    end
  end
end
