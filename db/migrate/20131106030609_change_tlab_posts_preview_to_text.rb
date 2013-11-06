class ChangeTlabPostsPreviewToText < ActiveRecord::Migration
  def up
    change_column :tlab_posts, :preview, :text, limit: nil
  end

  def down
    change_column :tlab_posts, :preview, :string
  end
end
