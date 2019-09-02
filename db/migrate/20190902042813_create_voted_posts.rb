class CreateVotedPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :voted_posts do |t|
      t.boolean :up
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
