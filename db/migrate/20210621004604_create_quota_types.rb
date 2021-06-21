class CreateQuotaTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :quota_types do |t|
      t.string :description
      t.integer :number

      t.timestamps
    end
  end
end
