class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|

      t.string :title
      t.string :description
      t.integer :year
      t.string :age_rating
      t.integer :duration

      t.timestamps
    end
  end
end
