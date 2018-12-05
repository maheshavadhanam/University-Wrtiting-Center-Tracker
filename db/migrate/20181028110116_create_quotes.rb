class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string 'quote'
      t.string 'author'
      t.timestamps
    end
  end
end
