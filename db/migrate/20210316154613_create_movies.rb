class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, unique: true, null: false
      t.integer :runtime, null: false
      t.integer :buffer, null: false
      t.text :details, null: false

      t.timestamps
    end
  end
end
