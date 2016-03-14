class GConfigs < ActiveRecord::Migration
  def change
    create_table :g_configs do |t|
      t.string  :artist_id_list
      t.integer :type_id
      t.date    :start_date
      t.date    :end_date
      t.integer :date_range
    end
  end
end
