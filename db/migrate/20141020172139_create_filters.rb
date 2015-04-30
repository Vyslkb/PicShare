class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.float :blur
      t.float :blueshift
      t.float :charcoal
      t.float :oilpaint
      t.float :sepia
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
