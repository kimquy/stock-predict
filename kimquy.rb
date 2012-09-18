# This program will fetch a tweet from twitter
# then print the status of that user to standard output


require 'json'
require 'net/http'

uri = URI 'http://api.twitter.com/1/statuses/user_timeline.json?screen_name=bagder&&count=10'
content = Net::HTTP.get(uri)

json = JSON content

puts ""

json.each { |j|
	j.each { |key, value|
		puts "#{value} \n\n" if key == "text"
		
	}
}



