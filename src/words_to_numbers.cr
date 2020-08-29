require "big"

VERSION = "0.1.0"

class String
  SMALL = {"zero", "one", "two", "three", "four", "five",
           "six", "seven", "eight", "nine", "ten",
           "eleven", "twelve", "thirteen", "fourteen", "fifteen",
           "sixteen", "seventeen", "eighteen", "nineteen"}

  TENS = {" ", " ", "twenty", "thirty", "forty", "fifty",
          "sixty", "seventy", "eighty", "ninety"}

  BIG = {" ",
         "thousand", "million", "billion", "trillion", "quadrillion",
         "quintillion", "sextillion", "septillion", "octillion", "nonillion", "decillion"}

  def words_to_numbers : BigInt
    words = self.downcase.gsub(/[,-]/," ").split

    negative_multiplyer : BigInt = 1.to_big_i

    if words[0] =~ /(minus|negative)/
      negative_multiplyer = -1.to_big_i
      words.shift
    end

    small : BigInt = 0.to_big_i
    total : BigInt = 0.to_big_i

    while words.size > 0
      word = words.shift
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
      when .matches? %r(of|and)
        nil
      else
        raise ArgumentError.new("Cannot understand \"#{word}\" in \"#{self}\"")
      end
    end

    negative_multiplyer * (total + small)
  end
end
