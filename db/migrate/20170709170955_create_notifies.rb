class CreateNotifies < ActiveRecord::Migration[5.0]
  def change
    create_table :notifies do |t|
      t.references :user
      t.integer :notifyable_id
      t.string :notifyable_type
      t.integer :status

      t.timestamps
    end
  end
end
