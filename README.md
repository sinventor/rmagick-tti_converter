## Text to image Converter
[![Gem Version](https://badge.fury.io/rb/rmagick-tti_converter.svg)](http://badge.fury.io/rb/rmagick-tti_converter)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rmagick-tti_converter', '~> 0.0.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rmagick-tti_converter

## Usage

```ruby
require 'rmagick/tti_converter'

text_wrapper = Magick::TTIConverter.new("./imgs_with_txt/")

sirius_text =<<-SomeTextD
 Sirius, also known as the Dog Star or Sirius A, is the brightest star in Earth's night sky. The name means "glowing" in Greek. With a visual magnitude of -1.46, the star is outshone only by several planets as well as the International Space Station.

Because Sirius is so bright, it was well-known to the ancients. What came as a surprise to astronomers was the discovery of a companion star, Sirius B, in 1862.

The companion is so much dimmer than Sirius — 10,000 times, in fact — that it wasn't until 2005 that astronomers were able to estimate its mass. 
Sirius is highly visible in the Northern Hemisphere winter night sky because it has a high relative luminosity to other stars, and it's relatively close to Earth (8.6 light-years). If the star were placed next to Earth's sun, Sirius would outshine it more than 20 times over.
 Today, Sirius is nicknamed the "Dog Star" because it is part of the constellation Canis Major — Latin for "the greater dog." The expression "dog days" refers to the period from July 3 through Aug. 11 when Sirius rises in conjunction with the sun. The ancients felt that the combination of the sun during the day and the star at night was responsible for the extreme heat that is experienced during mid-summer.

The star is present in ancient astronomical records of the Greeks, Polynesians and several other cultures. Perhaps most notably, the Egyptians based their calendar on when Sirius was first visible in the eastern sky, shortly before sunrise. They called it the "Nile Star" because it always returned just before the river rose, and so announced the coming of floodwaters, which would renourish their lands.
SomeTextD

text_wrapper.make_image(sirius_text, file_name: "sirius_descr.jpg")

dinosaur_text = <<-TEXTABOUTDINOS
Dinosaur Fact #1: What is a Dinosaur? When scientists talk of dinosaurs, they mean a special kind of creature that lived on land during the Triassic, Jurassic, or Cretaceous period. But a lot of people say "dinosaur" when they mean any prehistoric creature, such as sea creatures or pteradactyls.

Dinosaur Facts #2: What are the Ages of Dinosaurs? They are Triassic, Jurassic and Cretaceous.You can learn more about those on the dinosaur history page.

Dinosaur Fact #3: The Smartest Dinosaur was ... The Troodon! Scientists measure smartness by figuring out how big an animal compared to its body. This is called "encephalization quotient." Troodon wins! Even so, they think he was only about as smart as a modern possum. But for a dinosaur, that was pretty smart! For more on smart dinosaurs see this article.

Dinosaur Fact #4: The Dumbest Dinosaur was ... The stegosaurus! It had a brain as big as a walnut in a body weighing nearly two tons! "Dumb" isn't a nice word, even if it is a dinosaur fact. Let's just call Stegosaurus "less smart than a Troodon"!

Dinosaur Fact #5: The Fastest Dinosaur was ... Coelophysis and other Ornithomimosaurs. Scientists think these dinosaurs ran up to 30 miles per hour for short distances!

Dinosaur Facts #6: The Biggest Dinosaurs were: Saurpods. Seismosaurus was 165 feet long (it's tail helped!). Arentinosaurus was the heaviest at 100 tons. The Brachiosaurus was 39 feet high (which helped it reach branches in trees). Giganotosaurus was the largest hunting dinosaur, at 46 feet long and up to 8 tons!
TEXTABOUTDINOS

text_wrapper.make_image(dinosaur_text, file_name: "dinosaur_descr.png", optimal_width: 90)
```
## And you can see results

### First generated image

![sirius_descr.jpg](https://github.com/sinventor/rmagick-tti_converter/blob/master/generated_images/sirius_descr.jpg)

### Second generated image

![dinosaur_descr.png](https://github.com/sinventor/rmagick-tti_converter/blob/master/generated_images/dinosaur_descr.png)

## Contributing

1. Fork it ( https://github.com/sinventor/rmagick-tti_converter/fork )
2. Create your feature branch (`git checkout -b some-feature`)
3. Commit your feature branch (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin some-feature`)
5. Create a new Pull Request

## License

It is free software, and may be redistributed under the terms specified in the LICENSE file.