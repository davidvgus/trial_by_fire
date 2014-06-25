class AddArgumentIdToEssay < ActiveRecord::Migration
  def change
    add_reference :essays, :argument, index: true
  end
end
