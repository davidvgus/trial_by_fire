class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.references :user, index: true
      t.string :title, index: true
      t.string :description
      t.text :body
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
