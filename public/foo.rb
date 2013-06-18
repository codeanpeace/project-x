require 'httparty'
require 'open-uri'
file = File.read("commoncore.json")
response = HTTParty.get(file)
response.each do |x|

  puts x

end