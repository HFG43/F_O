class CreateFamilies < ActiveRecord::Migration[7.1]
  def change
    create_table :families do |t|

      t.timestamps
    end
  end
end
