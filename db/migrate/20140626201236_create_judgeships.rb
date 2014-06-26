class CreateJudgeships < ActiveRecord::Migration
  def change
    create_table :judgeships do |t|
      t.references :user, index: true
      t.references :argument, index: true

      t.timestamps
    end
  end
end
