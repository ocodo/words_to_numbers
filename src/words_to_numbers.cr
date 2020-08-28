# TODO: Write documentation for `WordsToNumbers`

VERSION = "0.1.0"

SMALL = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
  "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"}

TENS = {"_", "_", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"}

BIG = {"_", "thousand", "million", "billion", "trillion", "quadrillion",
       "quintillion", "sextillion", "septillion", "octillion", "nonillion", "decillion"}

def words_to_number(words_in : String) : Int64

  words = words_in.downcase.gsub(/(,| and |-)/," ").split

  negmult : Int64 = 1

  if words[0] =~ /(minus|negative)/
    negmult = -1
    words.shift
  end

  small : Int64 = 0
  total : Int64 = 0

  words.each do |word|
    case word
    when "none"
      total = 0
    when .in? SMALL
      index = SMALL.index(word)
      small += index unless index.nil?
    when .in? TENS
      index = TENS.index(word)
      small += index * 10 unless index.nil?
    when "hundred"
      small *= 100
    when "thousand"
      total += small * 1000
      small = 0
    when .in? BIG
      index = BIG.index(word)
      total += small * 1000 ** index unless index.nil?
      small = 0
    else
      raise ArgumentError.new("Cannot understand #{word} in \"#{words_in}\"")
    end
  end

  negmult * (total + small)
end
