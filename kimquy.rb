# This program will fetch a tweet from twitter
# then print the status of that user to standard output


require 'json'
require 'net/http'

uri = URI 'http://api.twitter.com/1/statuses/user_timeline.json?screen_name=bagder&&count=1'
content = Net::HTTP.get(uri)

json = JSON content

myfile = File.open("tweets.txt")

json.each { |j|
	j.each { |key, value|
		myfile.write(value) if key == "text"
	}
}
