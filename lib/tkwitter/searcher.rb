class Tkwitter::Searcher
  class << self
  
  def fetch(expression, &block)
    Twitter.search(expression, :lang => 'pt')[0..7].each do |tweet|
      yield process(tweet)
    end
  end
  
  private
  
  def process(tweet)
    filename = "/tmp/#{Time.now.to_f}.jpg"
    system("wget #{tweet.profile_image_url} --output-document #{filename} -o /dev/null")
    {:image_filename =>  filename, :name => tweet.from_user, :date => tweet.created_at.strftime('%d/%m %H:%M'), :text => tweet.text}
  end
  
  end
end
