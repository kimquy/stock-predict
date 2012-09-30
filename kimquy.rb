# This program will fetch a tweet from twitter
# then print the status of that user to standard output
# Change the screen_name as well as the count

require 'rubygems'
require 'json'
require 'net/http'

uri = URI 'http://api.twitter.com/1/statuses/user_timeline.json?screen_name=google&&count=10'
content = Net::HTTP.get(uri)

json = JSON content

myfile = File.open("tweets.txt", 'w+')

json.each { |j|
	j.each { |key, value|
		myfile.write("#{value} \n") if key == "text"
	}
}
