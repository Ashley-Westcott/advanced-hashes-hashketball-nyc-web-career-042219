require "pry"

def game_hash
  hash = {
    :home => {
     :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16, 
          :points => 22, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30, 
          :shoe => 14, 
          :points => 12, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 12, 
          :blocks => 12, 
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11, 
          :shoe => 17, 
          :points => 17, 
          :rebounds => 19, 
          :assists => 10, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1, 
          :shoe => 19, 
          :points => 26, 
          :rebounds => 12, 
          :assists => 6, 
          :steals => 3, 
          :blocks => 8, 
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31, 
          :shoe => 15, 
          :points => 19, 
          :rebounds => 2, 
          :assists => 2, 
          :steals => 4, 
          :blocks => 11, 
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4, 
          :shoe => 18, 
          :points => 10, 
          :rebounds => 1, 
          :assists => 1, 
          :steals => 2, 
          :blocks => 7, 
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0, 
          :shoe => 16, 
          :points => 12, 
          :rebounds => 4, 
          :assists => 7, 
          :steals => 7, 
          :blocks => 15, 
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2, 
          :shoe => 14, 
          :points => 24, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 4, 
          :blocks => 5, 
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8, 
          :shoe => 15, 
          :points => 33, 
          :rebounds => 3, 
          :assists => 2, 
          :steals => 1, 
          :blocks => 1, 
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33, 
          :shoe => 15, 
          :points => 6, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 22, 
          :blocks => 5, 
          :slam_dunks => 12
        }
      }
    }
  }
end

#Original Solution
# def num_points_scored(name)
#   points = 0
#     game_hash.each do | teams, team_data |
#       team_data.each do | attribute , values |
#         if attribute == :players
#           values.each do | player_name, stats |
#             if player_name == name
#               stats.each do | stat, num |
#                 if stat == :points
#                   points = num
#                 end
#               end
#             end
#           end
#         end
#       end
#     end
#   points
# end

def num_points_scored(name)
  game_hash.each do | team, team_data_hash |
    team_data_hash.each do | attribute, data |
      if attribute == :players
        data.each do | player, player_data_hash |
          if player == name
            return game_hash[team][attribute][player][:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do | team, team_data_hash |
    team_data_hash.each do | attribute, data |
      if attribute == :players
        data.each do | player, player_data_hash |
          if player == name
            return game_hash[team][attribute][player][:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  team_colors_array = []
    if game_hash[:home][:team_name] == team_name
      team_colors_array = game_hash[:home][:colors]
    elsif game_hash[:away][:team_name] == team_name
      team_colors_array = game_hash[:away][:colors]
    end
  team_colors_array
end

def team_names
  team_names_array = []
    game_hash.each do | team, team_data_hash |
      team_data_hash.each do | attribute, data |
        if attribute == :team_name
          team_names_array.push data
        end
      end
    end
  team_names_array
end

def player_numbers(team_name)
   jersey_num_array = []
    if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do | player, player_data_hash |
      player_data_hash.each do | stat, num |
        if stat == :number
          jersey_num_array << num
        end
      end
    end
  else 
    game_hash[:away][:players].each do | player, player_data_hash |
      player_data_hash.each do | stat, num |
        if stat == :number
          jersey_num_array << num
        end
      end
    end
  end
  jersey_num_array
end

def player_stats(player_name)
  game_hash.each do | team, team_data_hash |
    team_data_hash.each do | attribute, data |
      if attribute == :players
        data.each do | player, player_data_hash |
          if player == player_name
            return player_data_hash
          end
        end
      end
    end
  end
end


def big_shoe_rebounds
  player_with_biggest_shoe = nil
  player_with_biggest_shoe_rebounds = nil
      game_hash.each do | team, team_data_hash |
      team_data_hash.each do | attribute, data |
        if attribute == :players
          data.each do | player, player_data_hash |
            player_data_hash.each do | stat,num |
              if stat == :shoe
                if player_with_biggest_shoe == nil
                player_with_biggest_shoe = num
                player_with_biggest_shoe_rebounds = game_hash[team][:players][player][:rebounds]
                elsif num > player_with_biggest_shoe
                player_with_biggest_shoe = num
                player_with_biggest_shoe_rebounds = game_hash[team][:players][player][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  player_with_biggest_shoe_rebounds
end
        
        
        
     