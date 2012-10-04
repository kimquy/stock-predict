# Kimquy - Alchemy implementation - Stock Predict
#
# I didn't get very far on this. I am somewhat limited by not knowing ruby
# fully, but it should be an ok start.
# Feel free to change whatever you need, it will be neat to see the 
# sentiment analysis. 

require_relative "AlchemyAPI.rb"
require 'json'

alchemyObj = AlchemyAPI.new();
alchemyObj.setAPIKey("e460eeb7e62123b5282b9f7d79898770b8cb04f3");

alchdat = Hash.new	# A hash style arrayto hold more hash style arrays with the tweets and sentiment scores

$count = 0	# explicitly declared variable for the counter

infile = File.new("tweets.txt", "r")

infile.each_line { |tweet|	# store each line in infile in the variable tweet, then do the following

	result = alchemyObj.TextGetTextSentiment( tweet, "json" )	# Get the sentiment of the file tweet in json form
	sentiment = JSON.parse(result)["docSentiment"]		# Parse the structure to a ruby hash and set the docSentiment sub-hash to a vairable

	temph = Hash.new
	temph["tweet"] = tweet	# store the tweet in the array

	if sentiment["type"] == "neutral"	# If the sentiment is neutral, the score doesn't exist, so set the array's score as 0
		temph["score"] = "0.0"
	else
		temph["score"] = sentiment["score"]		# otherwise, set it as the score
	end

	alchdat[$count] = temph	# put the tweet/score array as an entry in the data array 

	

	$count += 1	# increment the counter

}

puts alchdat[0]["score"]
puts alchdat[2]["score"]
puts alchdat[4]["score"]
puts alchdat[7]["score"]
puts alchdat[8]["score"]

puts alchdat[1]["tweet"]
puts alchdat[3]["tweet"]
puts alchdat[5]["tweet"]
puts alchdat[6]["tweet"]
puts alchdat[9]["tweet"]