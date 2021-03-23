class DropColumnFromShowTimes < ActiveRecord::Migration[6.1]
  def change
    remove_column :show_times, :tickets_sold
  end
end
