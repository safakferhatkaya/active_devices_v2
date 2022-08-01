class AddLastOnlineToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :last_online, :datetime
  end
end
