module Tkwitter::Searcher

  def self.fetch(expression, &block)
    Twitter.search(expression, :lang => 'pt')[0..7].each do |tweet|
      yield process(tweet)
    end
  end
  
  private
  
  def self.process(tweet)
    {
      :image_filename => Tkwitter::ImageFetcher.get(tweet.profile_image_url), 
      :name => tweet.from_user, 
      :date => tweet.created_at.strftime('%d/%m %H:%M'), 
      :text => tweet.text
    }
  end
  
end
