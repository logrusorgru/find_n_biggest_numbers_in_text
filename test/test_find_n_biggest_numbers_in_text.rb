
require "minitest/autorun"
require "find_n_biggest_numbers_in_text"

class FindNBiggestNumbersInTextTest < MiniTest::Test

	def new_finder
		FindNBiggestNumbersInText::Finder.new
	end

	def test_no_numbers_given
		assert_equal [], new_finder.find("", 10)
	end

	def test_number_inside_letters
		assert_equal [1234], new_finder.find("a1234b", 10)
	end

	def test_uniqueness
		assert_equal [1], new_finder.find("1 1 1 1 1", 10)
	end

	def test_large_number_exception
		got_exception = false
		begin
			long = "" # 10 x 10 x 10 = 1000
			101.times do |i|
				long += "1234567890"
			end
			new_finder.find(long, 10)	
		rescue
			got_exception = true
		end
		assert_equal true, got_exception
	end

	def test_numbers_limit
		line = "1 2 3 4 5 6 7 8 9 10"
		assert_equal [10, 9, 8, 7, 6], new_finder.find(line, 5)
	end

end
