# Charosc

[![Build Status](https://travis-ci.org/unfodev/charosc.png?branch=master)](https://travis-ci.org/unfodev/charosc)

## Installation

```
$ gem install charosc
```

## Usage

```ruby
text = File.read("/path/to/text")

generator = Charosc::Generator.new(
  text,        # Input string
  top:    300, # Top of modulation range
  bottom: 10,  # Bottom of modulation range
  inc:    0.5  # Increment amount per #next call on modulator (Oscillator)
)

generator.generate(1000) #=> Returns a 1000-char string
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
