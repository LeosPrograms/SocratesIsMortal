# def initialize
# 	@premises = [['is socrates', true, 'is man', true],['is man', true, 'is mortal', true]]
# 	@conclusion =  'is mortal'
# 	@known = [['is socrates', true]]
# end

module SyllogismsHelper

	# def to_boolean(string)
	# 	if string == 'true' || string == 't'
	# 	  true
	# 	elsif string == 'false' || string == 'f'
	# 	  false
	# 	end
	# end

	def not_a_copy(array, item, itemvalue)
		result = true
		for i in 0...array.length do
			item_array = array[i]
			if (item_array[0]==item) && (item_array[1]==itemvalue)
				result = false
			end
		end
		result
	end

	def conflicts?(array, item, itemvalue)
		result = false
		for i in 0...array.length do
			item_array = array[i]
			if (item_array[0]==item) && (item_array[1]!=itemvalue)
				result = true
			end
		end
		result
	end

	# def add_to_known(known)
	# 	puts "what do you know?"
	# 	known1 = gets.chomp
	# 	puts "is (t/f): "
	# 	known2 = to_boolean(gets.chomp)
	# 	known << [known1, known2]
	# end

	# def premise
	# 	print "if the sentence: "
	# 	part1 = gets.chomp
	# 	print "is (t/f): "
	# 	part2 = gets.chomp
	# 	part2 = to_boolean(part2)
	# 	print "then the sentence: "
	# 	part3 = gets.chomp
	# 	print "is (t/f): "
	# 	part4 = gets.chomp
	# 	part4 = to_boolean(part4)

	# 	analyze
	# 	if conflicts?(@known, part3, part4)
	# 		puts "error: #{part3} cannot be #{part4}, according to previous statements"
	# 	else
	# 		@premises << [part1, part2, part3, part4]
	# 	end
	# end

	def analyze(premises, known)
		premises.length.times do
			for i in 0...premises.length do
			if_this = premises[i][0]
			if_value = premises[i][1]
			then_this = premises[i][2]
			then_value = premises[i][3]

			known.each do |known|
				copy_status = not_a_copy(known, then_this, then_value)
				if (known[0]==if_this)&&(known[1]==if_value)&&copy_status
					known << [then_this, then_value]
				end
			end
		end
		end

	end

	# def print_analyze
	# 	puts "\nCONCLUSIONS"
	# 	@known.each do |i|
	# 		print i[0]; print " : "; print i[1]
	# 		puts ""
	# 	end
	# end

	def assertion(premises, known)
		analyze(premises, known)
		puts "what conclusion would you like to analyze?"
		conclusion = gets.chomp
		final = []
		known.each do |statement|
				final << statement if statement[0] == conclusion
		end
		final.each do |i|
			puts "\n#{final[0][0]} is definitively: #{final[0][1]}"
		end
	end

	# def loop
	# 	while true do
	# 		puts "\noptions: fact, premise, assertion, end"
	# 		input = gets.chomp.downcase
	# 		case input
	# 		when "fact" then add_to_known
	# 		when "premise" then premise
	# 		when "analyze" then analyze; print_analyze
	# 		when "assertion" then assertion
	# 		when "end" then break
	# 		end
	# 	end
	# end

end