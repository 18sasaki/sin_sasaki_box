class Cds < ActiveRecord::Migration
  def change
    create_table :cds do |t|
      t.string  :title
      t.integer :artist_id
      t.integer :type_id
      t.date    :release_date
    end
  end
end
