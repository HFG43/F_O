class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.date :birthday, null: false
      t.references :family, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
