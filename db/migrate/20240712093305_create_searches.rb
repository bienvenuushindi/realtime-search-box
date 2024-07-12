class CreateSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :searches do |t|
      t.string :query
      t.integer :count
      t.integer :result_count

      t.timestamps
    end
  end
end
