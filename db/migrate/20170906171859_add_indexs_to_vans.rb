class AddIndexsToVans < ActiveRecord::Migration[5.1]
  def change
    add_index :vans, [:id, :type]
  end
end
