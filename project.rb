require 'terminal-table'
require 'artii'
require 'csv'

FILE_NAME = 'data.csv'

  def clear
    system "clear"
  end

  def read_player_from_csv
    players = CSV.read(FILE_NAME, headers: true)
  end

  def team_stats()
    players = CSV.read(FILE_NAME, headers: false)
    puts Terminal::Table.new :title => "Team Statistics", :rows => players
  end

  def coach_login
    puts "Enter your coach password"
    print "> "
    password = gets.chomp
    if password == "password"
      coach_options
    else
      puts "Please check your log in details and try again."
      main_menu
    end
  end

  def coach_options
    puts "What do you want to see? team/player?"
    answer = gets.chomp
      case answer
      when "team"
        team_stats
      when "player"
        playerlist
        #puts "shows player list to choose from"
        puts "Select player from list"
        choice = gets.chomp
        CSV.foreach(FILE_NAME, :headers => true) do |row|
          puts row["choice"]
        end
    end
  end

  def playerlist
    CSV.foreach(FILE_NAME, :headers => true) do |row|
      puts row['Name']
    end
  end


  def player_login
    puts "Enter your full name"
    name = gets.chomp
    puts "Here are your team stats"
    team_stats
  end

  def statistican_login
    puts "Enter your statistician password"
    password = gets.chomp
      if password == "admin"
        puts "Thanks. Here's the link (url) to the players' database."
      else
        puts "Please check your log in details and try again."
        main_menu
      end
  end

  def main_menu
    clear
    a = Artii::Base.new :font => 'script'
    a.asciify('Basketball Analytics')

    puts a.asciify('Basketball Analytics')

    puts "Who are you?"
    puts "1.Coach"
    puts "2.Player"
    puts "3.Statistician"
    puts "4.None of the above"
    print "> "
    choice = gets.chomp
    clear

    case choice
    when "1"
      coach_login
    when "2"
      player_login
    when "3"
      statistican_login
    when "4"
      puts "You have no business being here. I suggest you evaluate your life decisions. Goodbye!"

      exit
    end
  end


  main_menu
