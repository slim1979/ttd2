class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :start_station_id
      t.integer :finish_station_id
      t.belongs_to :user
      t.timestamps
    end
  end
end
