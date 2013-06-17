module Tlab
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged

    belongs_to :author
  end
end
