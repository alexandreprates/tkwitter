module Tkwitter::ImageFetcher
  
  def self.get(url)
    filename = "tmp/#{Time.now.to_f}"
    File.open(filename, 'w') do |f|
      f.write open(url).read
    end
    filename
  end
  
end