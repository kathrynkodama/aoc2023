digit_dic = { "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5,
            "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9} 
File.open("./day_one_input.txt", "r") do |f|
  sum = 0
  f.each_line do |line|
    arr = line.scan(/(?=(one|two|three|four|five|six|seven|eight|nine|\d))/).flatten
    first = digit_dic.key?(arr[0]) ? digit_dic[arr[0]] : arr[0]
    last = digit_dic.key?(arr[-1]) ? digit_dic[arr[-1]] : arr[-1]
    sum += (first.to_s + last.to_s).to_i
  end
  puts "final sum: #{sum}"
end

#rtvz4bsdzqeightwodth

