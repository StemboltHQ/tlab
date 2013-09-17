module Tlab
  class PostDecorator < Draper::Decorator
    delegate_all

    def share_facebook request
      "https://www.facebook.com/sharer/sharer.php?u=#{request.original_url}"
    end

    def share_twitter request, params = {}
      params = { url: request.original_url }.merge(params)
      "http://twitter.com/share?#{params.to_query}"
    end

    def share_linkedin request
      "http://www.linkedin.com/shareArticle?mini=true&url=#{request.original_url}&title=#{title}"
    end

    def share_google_plus request
      "https://plus.google.com/share?url=#{request.original_url}"
    end
  end
end
