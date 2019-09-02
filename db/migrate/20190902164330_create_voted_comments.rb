class CreateVotedComments < ActiveRecord::Migration[5.2]
  def change
    create_table :voted_comments do |t|
      t.boolean :state
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
