class ModifySearchesTable < ActiveRecord::Migration[7.1]
  def up
    remove_column :searches, :result_count
    change_column_default :searches, :count, from: nil, to: 0
  end

  def down
    add_column :searches, :result_count, :integer
    change_column_default :searches, :count, from: 0, to: nil
  end
end
