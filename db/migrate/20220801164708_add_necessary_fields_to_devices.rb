class AddNecessaryFieldsToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :password, :string
    remove_column :devices, :password_digest
    add_column :devices, :notes, :string
  end
end
