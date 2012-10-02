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


infile = File.new("tweets.txt", "r")

infile.each_line { |tweet|	# store each line in infile in the variable tweet, then do the following

	puts tweet	# comment this out to just see the numbers

	result = alchemyObj.TextGetTextSentiment( tweet, "json" )	# Get the sentiment of the file tweet in json form

	sentiment = JSON.parse(result)["docSentiment"]		# Parse the structure to a ruby hash and set the docSentiment sub-hash to a vairable

	if sentiment["type"] == "neutral"	# If the sentiment is neutral, the score doesn't exist, so print 0
		puts "0.0"
	else
		puts sentiment["score"]		# otherwise, print the score
	end

	puts "\n"	#a new line, for neat formatting


}
