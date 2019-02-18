class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :e_mail
      t.string :phone_number
      t.string :picture

      t.timestamps
    end
  end
end
