class CreateFamilies < ActiveRecord::Migration[7.1]
  def change
    create_table :families do |t|
      t.string :family_name, null: false
      t.string :family_registration_email, null: false

      t.timestamps
    end
  end
end
