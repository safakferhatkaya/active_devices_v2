class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :reference
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.boolean :is_active, default: false
      t.string :password_digest
      t.timestamps
    end
  end
end
