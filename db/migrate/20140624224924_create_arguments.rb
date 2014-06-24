class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.integer :owner_id
      t.integer :con_side_id
      t.text :con_side_essay
      t.integer :winner_id
      t.integer :loser_id
      t.integer :outcome
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :arguments, :owner_id
    add_index :arguments, :con_side_id
  end
end
