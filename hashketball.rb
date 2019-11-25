
def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => "Black, White",
      :players => [
        {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => "Turquoise, Purple",
      :players => [
        {:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2,:blocks => 7, :slam_dunks => 2},
        {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
        {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
      ]
    }
  }
end

def num_points_scored(player)
  # Finds the player from the home team
  game_hash[:home][:players].each do |player_hash|
    player_stats = player_hash
    player_name = player_hash[:player_name]

    if player_name == player
      return player_stats[:points]
    end
  end

  # Finds the player from the away team
  game_hash[:away][:players].each do |player_hash|
    player_stats = player_hash
    player_name = player_hash[:player_name]

    if player_name == player
      return player_stats[:points]
    end
  end

  nil
end

def shoe_size(player)
  # Finds the player from the home team
  game_hash[:home][:players].each do |player_hash|
    player_stats = player_hash
    player_name = player_hash[:player_name]

    if player_name == player
      return player_stats[:shoe]
    end
  end

  # Finds the player from the away team
  game_hash[:away][:players].each do |player_hash|
    player_stats = player_hash
    player_name = player_hash[:player_name]

    if player_name == player
      return player_stats[:shoe]
    end
  end

  nil
end

def team_colors(team)
  return game_hash[:home][:colors].split(', ') if game_hash[:home][:team_name] == team
  return game_hash[:away][:colors].split(', ') if game_hash[:away][:team_name] == team

  nil
end

def team_names
  teams_playing = []

  teams_playing << game_hash[:home][:team_name]
  teams_playing << game_hash[:away][:team_name]

  teams_playing
end

def player_numbers(team)
  player_numbers = []

  # checks for team name then returns the players numbers
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |player_hash|
      player_num = player_hash[:number]

      player_numbers << player_num
    end
  elsif game_hash[:away][:team_name] == team
    game_hash[:away][:players].each do |player_hash|
      player_num = player_hash[:number]

      player_numbers << player_num
    end
  end

  return "sorry that team does not exist try again" if player_numbers.empty?

  player_numbers
end

def player_stats(player)
  # Finds the player from the home team
  game_hash[:home][:players].each do |player_hash|
    player_stats = player_hash.dup
    player_name = player_hash[:player_name]
    player_stats.delete(:player_name)

    if player_name == player
      return player_stats
    end
  end

  # Finds the player from the away team
  game_hash[:away][:players].each do |player_hash|
    player_stats = player_hash.dup
    player_name = player_hash[:player_name]
    player_stats.delete(:player_name)

    if player_name == player
      return player_stats
    end
  end

  nil
end

def big_shoe_rebounds
  biggest_shoesize = 0
  num_of_rebounds = 0

  # Finds the biggest show from the home team
  game_hash[:home][:players].each do |player_hash|
    player_shoesize = player_hash[:shoe]
    player_rebounds = player_hash[:rebounds]

    if player_shoesize > biggest_shoesize
      biggest_shoesize = player_shoesize
      num_of_rebounds = player_rebounds
    end
  end

  # Finds the biggets shoe from the away team
  game_hash[:away][:players].each do |player_hash|
    player_shoesize = player_hash[:shoe]
    player_rebounds = player_hash[:rebounds]

    if player_shoesize > biggest_shoesize
      biggest_shoesize = player_shoesize
      num_of_rebounds = player_rebounds
    end
  end

  num_of_rebounds
end


def most_points_scored
  max_points_scored = 0
  player = ""

  game_hash[:home][:players].each do |player_hash|
    player_name = player_hash[:player_name]
    player_points = player_hash[:points]

    if player_points > max_points_scored
      max_points_scored = player_points
      player = player_name
    end
  end

  game_hash[:away][:players].each do |player_hash|
    player_name = player_hash[:player_name]
    player_points = player_hash[:points]

    if player_points > max_points_scored
      max_points_scored = player_points
      player = player_name
    end
  end

  player
end

def winning_team
  home = 0
  away = 0

  game_hash[:home][:players].each do |player_hash|
    player_points = player_hash[:points]

    home += player_points
  end

  game_hash[:away][:players].each do |player_hash|
    player_points = player_hash[:points]

    away += player_points
  end

  if home > away
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_player_name = ""

  game_hash[:home][:players].each do |player_hash|
    player_name = player_hash[:player_name]

    if player_name.length > longest_player_name.length
      longest_player_name = player_name
    end
  end

  game_hash[:away][:players].each do |player_hash|
    player_name = player_hash[:player_name]

    if player_name.length > longest_player_name.length
      longest_player_name = player_name
    end
  end

  longest_player_name
end

def player_with_longest_name_stats
  longest_player_name = ""
  longest_player_name_stats = {}

  game_hash[:home][:players].each do |player_hash|
    player_stats = player_hash
    player_name = player_hash[:player_name]

    if player_name.length > longest_player_name.length
      longest_player_name = player_name
      longest_player_name_stats = player_stats
    end
  end

  game_hash[:away][:players].each do |player_hash|
    player_stats = player_hash
    player_name = player_hash[:player_name]

    if player_name.length > longest_player_name.length
      longest_player_name = player_name
      longest_player_name_stats = player_stats
    end
  end

  longest_player_name_stats
end



def long_name_steals_a_ton?
  game_hash[:home][:players].each do |player_hash|
    player_steals = player_hash[:steals]

    if player_with_longest_name_stats[:steals] < player_steals
      return false
    end
  end

  game_hash[:away][:players].each do |player_hash|
    player_steals = player_hash[:steals]

    if player_with_longest_name_stats[:steals] < player_steals
      return false
    end
  end

  true
end
