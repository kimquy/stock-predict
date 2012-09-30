# This program will fetch a tweet from twitter
# then print the status of that user to standard output
# Change the screen_name as well as the count

require 'rubygems'
require 'json'
require 'net/http'

<<<<<<< HEAD
uri = URI 'http://api.twitter.com/1/statuses/user_timeline.json?screen_name=google&&count=10'
=======
uri = URI 'http://api.twitter.com/1/statuses/user_timeline.json?screen_name=bagder&&count=1'
>>>>>>> 01f5f6f43952b9394295b5c4710bea20e599460c
content = Net::HTTP.get(uri)

json = JSON content

json.each { |j|
	j.each { |key, value|
<<<<<<< HEAD
		myfile.write("#{value} \n") if key == "text"
=======
		puts value if key == "text"
>>>>>>> 01f5f6f43952b9394295b5c4710bea20e599460c
	}
}
