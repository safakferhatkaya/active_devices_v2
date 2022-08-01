class AddPasswordDigestToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :password_digest, :string
    remove_column :devices, :password
  end
end
