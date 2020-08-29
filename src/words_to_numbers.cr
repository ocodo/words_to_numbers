require "big"

VERSION = "0.1.0"

SMALL = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
  "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"}

TENS = {" ", " ", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"}

BIG = {" ", "thousand", "million", "billion", "trillion", "quadrillion",
       "quintillion", "sextillion", "septillion", "octillion", "nonillion", "decillion"}

def words_to_number(words_in : String) : BigInt

  words = words_in.downcase.gsub(/(,| and |-)/," ").split

  negmult : BigInt = 1.to_big_i

  if words[0] =~ /(minus|negative)/
    negmult = -1.to_big_i
    words.shift
  end

  small : BigInt = 0.to_big_i
  total : BigInt = 0.to_big_i

  words.each do |word|
    case word
    when "hundred"
      small *= 100
    when "none"
      total = 0.to_big_i
    when "a"
      small += 1.to_big_i
    when .matches? %r(couple|pair)
      small = 2.to_big_i
    when .in? SMALL
      index = SMALL.index(word)
      small += index unless index.nil?
    when .in? TENS
      index = TENS.index(word)
      small += index * 10 unless index.nil?
    when .in? BIG
      index = BIG.index(word)
      total += small * (1000 ** index) unless index.nil?
      small = 0.to_big_i
    when "of"
      nil
    else
      raise ArgumentError.new("Cannot understand \"#{word}\" in \"#{words_in}\"")
    end
  end

  negmult * (total + small)
end
