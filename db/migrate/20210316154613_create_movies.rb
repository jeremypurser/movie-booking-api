class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, unique: true
      t.integer :runtime
      t.integer :buffer
      t.text :details

      t.timestamps
    end
  end
end
