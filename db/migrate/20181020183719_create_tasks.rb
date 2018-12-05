class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, foreign_key: true
      t.string 'title'
      t.timestamp 'create_date'
      t.timestamp 'target_date'
      t.integer 'target_value'
      t.integer 'current_value', :default => 0
      t.string 'desc'
      t.string 'measure'
      t.boolean 'email'
      t.timestamps
    end
  end
end
