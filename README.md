# Charosc

[![Build Status](https://travis-ci.org/unfodev/charosc.png?branch=master)](https://travis-ci.org/unfodev/charosc)

## Installation

```
$ gem install charosc
```

## Usage

```
Usage: charosc [options] <textfile>
         --length, -l <i>:   Output length in characters (default: 5000)
          --depth, -d <i>:   Sequence depth (default: 3)
        --mod-enabled, -m:   Enable modulation
        --mod-top, -o <i>:   Highest value in modulation range (default: 500)
     --mod-bottom, -b <i>:   Lowest value in modulation range (default: 2)
  --mod-increment, -i <i>:   Modulator per-step increment (default: 1)
    --output-file, -u <s>:   Output file
            --version, -v:   Print version and exit
               --help, -h:   Show this message
```
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
