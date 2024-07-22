#The Elf would first like to know which games would have been possible if the bag contained only 12 red cubes, 13 green cubes, and 14 blue cubes?

#In the example above, games 1, 2, and 5 would have been possible if the bag had been loaded with that configuration. However, game 3 would have been impossible because at one point the Elf showed you 20 red cubes at once; similarly, game 4 would also have been impossible because the Elf showed you 15 blue cubes at once. If you add up the IDs of the games that would have been possible, you get 8.

sample = [
  "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green", 
  "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
  "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
  "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
  "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
]

MAX_RED = 12
MAX_GREEN = 13
MAX_BLUE = 14

def extract_number(colour, game) 
  m = game.match(/(\d+)(?=#{colour})/)
  puts m.captures
  # m.to_s
  m.to_i
end

File.open("./input.txt", "r") do |f| 
  game_sum = 0
  f.each_line do |row| 
    valid = true

    # match: Game 100:
    # captures: 100
    game_number = row.match(/Game\s(\d+):/).captures[0].to_i
    puts row.match(/Game\s(\d+):/).captures
    puts ("-----")
    puts "game number: #{game_number}"
    for game in row.tr(' ', '').split(";")
      green = extract_number("green", game)
      blue = extract_number("blue", game)
      red = extract_number("red", game)
      valid = false if green > MAX_GREEN || blue > MAX_BLUE || red > MAX_RED
    end
    puts "game valid? #{valid}"
    game_sum += game_number if valid
    puts "game sum: #{game_sum}"
    puts ("------")
  end
end

