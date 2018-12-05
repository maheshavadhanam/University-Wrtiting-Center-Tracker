class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string 'first_name'
      t.string 'last_name'
      t.string 'email'
      t.string 'confirm_code'
      t.boolean 'confirm', :default => false
      t.string 'password'
      t.string 'salt'
      t.timestamps
    end
  end
end
