# Words to Numbers

Simple words to numbers parser (BigInt supported only).

For example:

###### "Three hundred and twelve" = 312

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  words_to_numbers:
    github: crystal-castles/words_to_numbers
```

## Usage

`words_to_numbers` is an extension of `String`

```crystal
require "words_to_numbers"

# Parse string of words to numbers
number = "Seventeen thousand".words_to_numbers
#=> 17000
```

## Development

This library's specs are put in `spec` directory.
They can run by `crystal spec` command.

## Contributing

1. [Fork it](https://github.com/crystal-castles/words_to_numbers/fork)
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Add test(s) in `spec/` to cover your changes & write some code, until your test are passing.
1. [Commit your changes](https://chris.beams.io/posts/git-commit/) (`git commit -am 'Describe your change'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request on github

## License

MIT

(c) Jason Milkins - 2020 crystal-castles

## Contributors

- Jason Milkins
