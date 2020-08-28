#!/usr/bin/env ruby
require_relative 'number_names'

def from_words(num)
  words = num.downcase.gsub(/(,| and |-)/,' ').split
  if words[0] =~ /(minus|negative)/
    negmult = -1
    words.shift
  else
    negmult = 1
  end
  small, total = 0, 0
  for word in words
    case word
    when 'none'
      total = 0
    when *SMALL
      small += SMALL.index(word)
    when *TENS
      small += TENS.index(word) * 10
    when 'hundred'
      small *= 100
    when 'thousand'
      total += small * 1000
      small = 0
    when *BIG
      total += small * 1000 ** BIG.index(word)
      small = 0
    else
      raise ArgumentError, "Don't understand %s part of %s" % [word, num]
    end
  end
  negmult * (total + small)
end

names = [
  "none",
  "one",
  "twenty-five",
  "minus one hundred and seventeen",
  "one hundred and fifty-six",
  "minus two thousand two",
  "nine thousand, seven hundred, one",
  "minus six hundred and twenty six thousand, eight hundred and fourteen",
  "four million, seven hundred thousand, three hundred and eighty-six",
  "fifty-one billion, two hundred and fifty-two million, seventeen thousand, one hundred eighty-four",
  "two hundred and one billion, twenty-one million, two thousand and one",
  "minus three hundred trillion, nine million, four hundred and one thousand and thirty-one",
  "seventeen quadrillion, one hundred thirty-seven",
  "one quintillion, eight trillion and five",
  "minus nine quintillion, two hundred and twenty-three quadrillion, three hundred and seventy-two trillion, thirty-six billion, eight hundred and fifty-four million, seven hundred and seventy-five thousand, eight hundred and eight"
]

names.each do |name|

  puts "#{from_words name} - #{name}"

end
