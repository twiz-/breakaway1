module YoutubethumbHelper
  
  def youtube_thumb_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<img class="thumb-town"src="http://i1.ytimg.com/vi/#{ youtube_id }/mqdefault.jpg">}
  end
end