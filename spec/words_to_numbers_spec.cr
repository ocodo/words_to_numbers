require "./spec_helper"

describe "Words to numbers" do

  examples = [
    {"none", 0},
    {"one", 1},
    {"twenty-five", 25},
    {"minus one hundred and seventeen", -117},
    {"one hundred and fifty-six", 156},
    {"minus two thousand two", -2002},
    {"nine thousand, seven hundred, one", 9701},
    {"minus six hundred and twenty six thousand, eight hundred and fourteen", -626814},
    {"four million, seven hundred thousand, three hundred and eighty-six", 4700386},
    {"fifty-one billion, two hundred and fifty-two million, seventeen thousand, one hundred eighty-four", 51252017184},
    {"two hundred and one billion, twenty-one million, two thousand and one", 201021002001}
  ]

  it "converts words to a number" do
    examples.each do |example|
      str = example[0]
      num = example[1]
      words_to_number(str).should eq num
    end
  end
end
