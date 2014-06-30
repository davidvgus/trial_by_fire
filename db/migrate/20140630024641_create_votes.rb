class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :status, default: 0
      t.references :user, index: true
      t.references :argument, index: true

      t.timestamps
    end
  end
end
