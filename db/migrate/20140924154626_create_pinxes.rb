class CreatePinxes < ActiveRecord::Migration
  def change
    create_table :pinxes do |t|
      t.string :description

      t.timestamps
    end
  end
end
