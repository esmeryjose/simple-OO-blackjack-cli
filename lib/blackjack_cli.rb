class BlackjackCli
  attr_accessor :player, :dealer

  def initialize
    @dealer = Dealer.new
    @player = Player.new
  end

  def welcome
    # code #welcome here
    puts "Welcome to the Blackjack Table"
    puts "What's your name?"
    player.name = gets.strip
  end

  def deal_card
    # code #deal_card here
    # 1-9, facecards = 10, ace = 1 or 11
    rand(1..11)
  end

  def display_card_total
    # code #display_card_total here
    puts "Your cards add up to #{player.card_total}"
  end

  def prompt_user
    # code #prompt_user here
    puts "Type 'h' to hit or 's' to stay"
  end

  def get_user_input
    # code #get_user_input here
    gets.chomp
  end

  def end_game
    # code #end_game here
    puts "Sorry, you hit #{player.card_total}. Thanks for playing!"
  end

  def win
    puts "#{player.name}, you have won!!"
  end

  def draw
    puts "The game is a draw."
  end

  def initial_round
    # code #initial_round here
    player.card_total = (deal_card + deal_card)
    dealer.cards = [deal_card,deal_card]
    puts "Your cards add up to #{player.card_total}"
    puts "Dear cards: _ #{dealer.cards.first}"
  end

  def hit?(whos_playing)
    # code hit? here
    if whos_playing.class == Player
      prompt_user
      input = ""
      loop do
        input = get_user_input
        break if input == 'h' || input == 's'
        invalid_command
      end
      whos_playing.stay = true if input == 's'
      whos_playing.card_total += deal_card if input == 'h'
    end
    whos_playing.cards << deal_card if whos_playing.class == Dealer
  end

  def invalid_command
    # code invalid_command here
    puts "Please enter a valid command."
  end

  #####################################################
  # get every test to pass before coding runner below #
  #####################################################

  def run
    # code runner here
    welcome
    initial_round
    until player.card_total > 21 || player.stay
      hit?(player)
      display_card_total
    end

    end_game if player.card_total > 21

    win if player.card_total == 21

    until dealer.card_total >= 17
      hit?(dealer)
    end

    puts "Dealer's cards: #{dealer.cards.to_s}"
    if dealer.card_total <= 21
      # draw
      if dealer.card_total == player.card_total
        draw
      elsif dealer.card_total > player.card_total
        end_game
      else
        win
      end
    else
      win
    end
        
  end
end
