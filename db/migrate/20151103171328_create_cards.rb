class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.integer :exp_year
      t.integer :exp_month
      t.string :card_type

      t.timestamps null: false
    end
  end
end
