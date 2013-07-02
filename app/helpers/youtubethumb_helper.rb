module YoutubethumbHelper
  
  def youtube_thumb_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<iframe title="YouTube video player" src="http://img.youtube.com/vi/#{ youtube_id }/1.jpg" frameborder="0" allowfullscreen></iframe>}
  end
end