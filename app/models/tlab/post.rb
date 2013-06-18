module Tlab
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :history

    belongs_to :author
    validates :slug, presence: true
  end
end
