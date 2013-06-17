module Tlab
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :history

    belongs_to :author
    validates :slug, presence: true
    attr_accessor :author_name
    belongs_to :author, class_name: Tlab.author_class

  end
end
