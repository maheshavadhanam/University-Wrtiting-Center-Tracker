class CreateTimers < ActiveRecord::Migration[5.2]
  def change
    create_table :timers do |t|
      t.belongs_to :task, foreign_key: true
      t.integer 'hours', :default=>0
      t.integer 'minutes', :default=>0
      t.integer 'seconds', :default=>0
      t.timestamps
    end
  end
end
