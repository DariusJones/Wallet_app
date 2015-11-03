class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password
      t.integer :birth_month
      t.integer :birth_day
      t.decimal :balance
      t.string :phone

      t.timestamps null: false
    end
  end
end
