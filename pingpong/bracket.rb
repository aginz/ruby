class Bracket
  def initialize
    @players = []
  end

  def play_tournament
    get_players
    make_bracket
    say_winner
  end

  private

  def get_players
    done = false

    until done
      case ask("Would you like to add a player? (y)es or (n)o")
      when "y"
        @players << Player.new
      when "n"
        done = true
      else
        say("Invalid entry")
      end
    end
  end

  def make_bracket
    counter = 0

    until @players.count == 1
      say("ROUND #{counter += 1}....FIGHT!")
      sleep 1
      game = Round.new(@players)
      game.play_round
      @players = game.winners
    end
  end

  def say_winner
    winner = @players.pop

    say("Congratulations! #{winner.name.upcase} wins the tournament!")
  end
end
