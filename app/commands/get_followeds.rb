class GetFolloweds
  prepend SimpleCommand
  
  def initialize(token)
    @token = token
  end

  def call    
    url = 'https://api.spotify.com/v1/me/following?type=artist'
    response = RestClient.get(URI.encode(url), { 'Authorization': 'Bearer '<< @token })   
    followeds = []  
    artists = JSON.parse(response)['artists']
    artists['items'].each do |item|
      genres = ''
      item['genres'].each do |g|         
        genres = genres.to_s.empty? ? g.titleize : genres << ', ' << g.titleize
      end      

      followed = Followed.find_by_name(item['name'])
      if followed
        followed.update_attributes(
          genres: genres, 
          image_url: item['images'].last['url'], 
          total_followers: item['followers']['total']
        )
      elsif 
        followed = Followed.create(
          name: item['name'],
          external_url: item['external_urls']['spotify'],
          genres: genres,          
          image_url: item['images'].last['url'],
          total_followers: item['followers']['total']
        )      
      end
      followeds.push(followed)     
    end

    followeds
  rescue RestClient::ExceptionWithResponse => error    
    if error.response.code.equal?(403)      
      errors.add('Miss scope')
    end
  end
end
