class AddTokenToFamilies < ActiveRecord::Migration[7.1]
  def change
    add_column :families, :token, :string
  end
end
