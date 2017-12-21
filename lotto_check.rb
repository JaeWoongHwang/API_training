require 'open-uri'
require 'json'

# Prepare my lotto number
# Same code
# my_numbers = (1..45).to_a.sample(6)
my_numbers = [*1..45].sample(6)

url ='http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo='
page = open(url).read
info = JSON.parse(page)

# Get official lotto number
main_numbers = Array.new
info.each do |key, value|
  main_numbers << value if key.include? 'drwtNo'
end

main_numbers.sort!
bonus_number = info['bnusNo']

# Compare with my number and official number
# 두 배열의 중복 값을 변수에 넣어주는 코드 
match_numbers = main_numbers & my_numbers
match_count = match_numbers.count

# if match_count == 6 then puts '1st'
#   elsif match_count == 5 && my_numbers include? bonus_number then puts '2nd'
#   elsif match_count == 5 then  puts '3rd'
#   elsif match_count == 4 then  puts '4th'
#   elsif match_count == 3 then  puts '5th'
#   else then puts 'Failed'
# end

result =
  case[match_count, my_numbers.include?(bonus_number)]
    when[6, false]then '1st'
    when[5, true] then '2nd'
    when[5, false]then '3rd'
    when[4, false]then '4th'
    when[3, false]then '5th'
    else 'Failed'
  end

puts "my_numbers : #{my_numbers}"
puts "match_numbers : #{match_numbers}"
puts "match_count : #{match_count}"
puts "result : #{result}"
