class Twitter::Tweet
  def first_media_image_url(size:)
    media.first.media_url.to_s + ":" + size.to_s
  end
end