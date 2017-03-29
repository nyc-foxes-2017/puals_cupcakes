class CreateBacklogs < ActiveRecord::Migration[5.0]
  def change
    create_table :backlogs do |t|

      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
