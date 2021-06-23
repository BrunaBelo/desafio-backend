class CreateParliamentarians < ActiveRecord::Migration[6.0]
  def change
    create_table :parliamentarians do |t|
      t.string :name, null: false
      t.string :number_person_id
      t.string :federation_unity, null: false, limit: 2
      t.string :political_party
      t.string :card_parliamentary
      t.integer :register_id
      t.belongs_to :legislature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
