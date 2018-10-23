class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :file
      t.string :label

      t.timestamps
    end
  end
end
