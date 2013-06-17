class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :tlab_posts, :slug, :string, unique: true
  end
end
