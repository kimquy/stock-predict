# This program will fetch a tweet from twitter
# then print the status of that user to standard output
# Change the screen_name as well as the count

require 'rubygems'
require 'json'
require 'net/http'

uri = URI 'http://api.twitter.com/1/statuses/user_timeline.json?screen_name=google&&count=10000'
content = Net::HTTP.get(uri)

json = JSON content

time = Time.new			# create a time object
limit = "#{time.year}"		# get the year, in string form
if time.month < 10		
	now << "0"		# if the month is less than 10, tack a 0 onto the date string first
end				
limit << "#{time.month}"	# tack on the integer month, as a string
if time.day < 10		
	now << "0"		#
end				# repeat for the day
limit << "#{time.day}"		#
				
limit = Integer(limit) -10000	# convert to integer, set to last year and save for comparison

$yes = 1	# a flag for marking whether or not a tweet is too old


myfile = File.open('tweets.txt', 'w+')

json.each { |j|
	j.each { |key, value|

		if key == "created_at"		# take the date, get the year, month and day by string slicing and cat them together
			date = value
			datenum = "#{date}"[26..30]
		
			case "#{date}"[4..6]
			when "Jan"
				datenum << "01"
			when "Feb"
				datenum << "02"
			when "Mar"
				datenum << "03"
			when "Apr"
				datenum << "04"
			when "May"
				datenum << "05"
			when "Jun"
				datenum << "06"
			when "Jul"
				datenum << "07"
			when "Aug"
				datenum << "08"
			when "Sep"
				datenum << "09"
			when "Oct"
				datenum << "10"
			when "Nov"
				datenum << "11"
			when "Dec"
				datenum << "12"
			else
				datenum << "00"
			end

			datenum << "#{date}"[8..9]

			if Integer(datenum) < limit	# because tweets are always taken chronologically,
				$yes = 0		# once we find one too old, the rest will be to old as well,
			end				# so set the flag

		end

		if $yes == 1	# write the tweet to a file if we have yet to find one too old
			myfile.write("#{value} \n") if key == "text"
		end
	}
}
