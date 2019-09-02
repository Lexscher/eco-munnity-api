class AddDefaultStateToVotedPosts < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :voted_posts,
      :state,
      from: nil,
      to: "none"
    )
  end
end
