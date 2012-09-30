# Kimquy - Alchemy implementation - Stock Predict
#
# I didn't get very far on this. I am somewhat limited by not knowing ruby
# fully, but it should be an ok start.
# Feel free to change whatever you need, it will be neat to see the 
# sentiment analysis. 

require "alchemyAPI.rb"
require "json"

alchemyObj = AlchemyAPI.new();
alchemyObj.setAPIKey("e460eeb7e62123b5282b9f7d79898770b8cb04f3");

infile = File.new("tweets.txt", "r")
result = alchemyObj.TextGetTextSentiment(infile);

puts result.scan(JSON)

#aFile.each_line { |tweet|
	


