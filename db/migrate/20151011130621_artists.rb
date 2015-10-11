class Artists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string  :name
      t.string  :name_view
      t.string  :name_kana
      t.string  :rgb
      t.integer :sex
      t.integer :type_id
    end
  end
end
