class Dealer
  attr_accessor :cards

  def card_total
    cards.inject(0){|sum,i| sum + i}
  end
end
