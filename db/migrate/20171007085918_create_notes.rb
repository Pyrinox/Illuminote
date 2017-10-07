class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :label
      t.text :content
      t.datetime :time_stamp
      t.integer :index
      t.integer :level

      t.timestamps
      t.references :parent, index: true
    end
  end
end
