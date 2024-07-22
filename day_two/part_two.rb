#The Elf would first like to know which games would have been possible if the bag contained only 12 red cubes, 13 green cubes, and 14 blue cubes?
def extract_number(colour, game) 
  m = game.match(/(\d+)(?=#{colour})/).to_s
  puts "#{colour}: #{m.to_i}"
  m.to_i
end

File.open("./input.txt", "r") do |f| 
  game_sum = 0
  f.each_line do |row|
    game_number = row.match(/Game\s(\d+):/).captures[0].to_i
    puts ("-----")
    puts "game number: #{game_number}"
    max_blue = 0
    max_red = 0
    max_green = 0
    for game in row.tr(' ', '').split(";")
      puts game
      green = extract_number("green", game)
      blue = extract_number("blue", game)
      red = extract_number("red", game)
      max_green = green if green > max_green
      max_blue = blue if blue > max_blue
      max_red = red if red > max_red
      puts "max_green: #{max_green} ; max_blue: #{max_blue} ; max_red: #{max_red}"  
    end
    game_power = max_green * max_red * max_blue
    game_sum += game_power
    puts "game sum: #{game_sum}"
    puts ("------")
  end
end

