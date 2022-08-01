class AddPasswordToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :password, :string
    remove_column :devices, :password_digest
  end
end
