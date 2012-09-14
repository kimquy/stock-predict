require 'json'
require 'net/http'

uri = URI 'http://api.twitter.com/1/statuses/user_timeline.json?screen_name=bagder&&count=1'
content = Net::HTTP.get(uri)

json = JSON content

json.each { |j|
	j.each { |key, value|
		puts value if key == "text"
	}
}
