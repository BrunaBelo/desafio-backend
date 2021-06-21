class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :document_number
      t.datetime :issue_date
      t.decimal :value, precision: 9, scale: 2
      t.decimal :gloss_value, precision: 9, scale: 2
      t.decimal :net_value, precision: 9, scale: 2
      t.integer :month
      t.integer :year
      t.integer :installment_number
      t.string :passenger
      t.string :travel_part
      t.string :lot_number
      t.string :refund
      t.string :restitution
      t.string :id_documento
      t.string :document_url
      t.belongs_to :parliamentarian, null: false, foreign_key: true
      t.belongs_to :provider, null: false, foreign_key: true
      t.belongs_to :expense_type, null: false, foreign_key: true
      t.belongs_to :quota_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
