class Round
  attr_reader :winners

  def initialize(players)
    @players = players
    @winners = []
    @round_players = []
  end

  def play_round
    until @players.count == 0
      if @players.count == 1
        only_one_player
      else
        match_two_players
        enter_winner
      end
      reset_round
      sleep 1
    end
  end

  private

  def enter_winner
    winner = ask("Who won?")

    player1 = @round_players.first
    player2 = @round_players.last

    case winner
    when player1.name
      @winners << player1
    when player2.name
      @winners << player2
    else
      say("Invalid entry.")
      enter_winner
    end
  end

  def reset_round
    @round_players = []
  end

  def only_one_player
    player = select_random_player
    @winners << player
    say("#{player.name.upcase} does not have a rival and automatically wins the round.")
  end

  def match_two_players
    until @round_players.count == 2
      @round_players << select_random_player
      remove_last_round_player
    end
    say("Players have been selected...")
    @round_players.each do |player|
      puts player.name.upcase
    end
  end

  def select_random_player
    @players.sample
  end

  def remove_last_round_player
    @players.delete(@round_players.last)
  end
end
