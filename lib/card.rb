# shape (diamond, oval, squiggle)
# colour (green, red, purple)
# fill (blank, lined, filled)
# count (one, two, three)

Card = Struct.new(:shape, :colour, :fill, :count)

# card1 = Card.new('diamond', 'green', 'blank', 'one')
# card2 = Card.new('oval', 'red', 'blank', 'one')
# card3 = Card.new('diamond', 'purple', 'blank', 'one')

# card1 = Card.new('diamond', 'green', 'blank', 'one')
# card2 = Card.new('oval', 'red', 'lined', 'two')
# card3 = Card.new('squiggle', 'purple', 'filled', 'three')
# card4 = Card.new('circle', 'black', 'strike', 'four')

# card1 = Card.new('diamond', 'red', 'blank', 'one')
# card2 = Card.new('oval', 'red', 'lined', 'two')
# card3 = Card.new('squiggle', 'purple', 'filled', 'three')
# card1 = Card.new('diamond', 'green', 'blank', 'two')
# card2 = Card.new('oval', 'red', 'lined', 'two')
# card3 = Card.new('squiggle', 'purple', 'filled', 'three')

# card1 = Card.new('oval', 'green', 'blank', 'two')
# card2 = Card.new('oval', 'green', 'blank', 'one')
# card3 = Card.new('oval', 'green', 'blank', 'three')
cards = [card1, card2, card3]

def set?(*cards)
  # Add your implementation here
  card_count = cards.size
  shape_map = { shape: [], colour: [], fill: [], count: [] }.tap do |rs_hash|
    cards.each do |card|
      %i(shape colour fill count).each {|att| rs_hash[att].push card.send(att) unless rs_hash[att].include?(card.send(att))}
    end
  end
  return true if shape_map[:shape].count == 1 && shape_map[:count].count == card_count && shape_map[:fill].count == 1 && shape_map[:colour].count == 1
  return true if shape_map[:shape].count == card_count && shape_map[:count].count == card_count && shape_map[:fill].count == card_count && shape_map[:colour].count == card_count
  false
end
puts set? card1, card2, card3
