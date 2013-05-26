class CreateTlabPosts < ActiveRecord::Migration
  def change
    create_table :tlab_posts do |t|
      t.string :title
      t.string :preview
      t.text :body
      t.datetime :published_at
      t.belongs_to :author, index: true

      t.timestamps
    end
  end
end
