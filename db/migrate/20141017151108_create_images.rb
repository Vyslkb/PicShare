class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :description

      t.timestamps
    end
  end
end
