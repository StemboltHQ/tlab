module Tlab
  class PostDecorator < Draper::Decorator
    delegate_all

    def share_facebook request
      "https://www.facebook.com/sharer/sharer.php?u=#{request.original_url}"
    end

    def share_twitter request
      "http://twitter.com/share?url=#{request.original_url}"
    end

    def share_linkedin request
      "http://www.linkedin.com/shareArticle?mini=true&url=#{request.original_url}&title=#{title}"
    end

    def share_pinterest request
      #placeholder, missing required fields
      "http://pinterest.com/pin/create/button/?url=#{request.original_url}"
    end

  end
end
