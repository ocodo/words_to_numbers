# Words to Numbers

Simple words to numbers parser

# What's it do?

Try it... (after installing [Crystal][https://crystal-lang.org])

```
git clone git@github.com:jasonm23/words_to_numbers

cd words_to_numbers
crystal spec -v
```

```example
  "none" = 0
  "one" = 1
  "a couple hundred" = 200
  "couple thousand" = 2000
  "a couple of million" = 2000000
  "a couple" = 2
  "a pair" = 2
  "twenty-five" = 25
  "minus one hundred and seventeen" = -117
  "one hundred and fifty-six" = 156
  "minus two thousand two" = -2002
  "nine thousand, seven hundred, one" = 9701
  ...
```

# Notes

I wrote this as an exercise to help my 7 yr old learn some programming
ideas.

I didn't realise it would become a shard, so I'll get it ready to use
in your projects soon.
