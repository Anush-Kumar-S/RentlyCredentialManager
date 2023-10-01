class CreateCredentials < ActiveRecord::Migration[7.0]
  def change
    create_table :credentials do |t|
      t.string :name
      t.string :login_id
      t.string :login_password
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
