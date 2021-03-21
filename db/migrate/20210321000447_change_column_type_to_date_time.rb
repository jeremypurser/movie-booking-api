class ChangeColumnTypeToDateTime < ActiveRecord::Migration[6.1]
  def change
    change_column :show_times, :start_time, :datetime
    change_column :show_times, :end_time, :datetime
  end
end
