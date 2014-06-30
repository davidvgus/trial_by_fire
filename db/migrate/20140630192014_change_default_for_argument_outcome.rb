class ChangeDefaultForArgumentOutcome < ActiveRecord::Migration
  def change
    change_column :arguments, :outcome, :integer, default: 0
  end
end
