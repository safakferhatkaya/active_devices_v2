class AddIsCredentialsShowedToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :is_credentials_showed, :boolean, default: false
  end
end
