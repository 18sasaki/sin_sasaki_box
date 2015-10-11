class Types < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string  :key
      t.string  :view_name
    end
  end
end
