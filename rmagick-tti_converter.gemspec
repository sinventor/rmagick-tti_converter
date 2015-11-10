lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rmagick/tti_converter/version'

Gem::Specification.new do |spec|
  spec.name = 'rmagick-tti_converter'
  spec.version = Magick::TTIConverter::VERSION
  spec.authors = ['Rushan Alyautdinov']
  spec.email = 'rushan_oline@mail.ru'

  spec.summary = 'Text to image converter'
  spec.description = 'Text manipulator to generate image file with text content'
  spec.homepage = 'https://github.com/sinventor/rmagick-tti_converter'
  spec.files = ['lib/rmagick/tti_converter/version.rb', 'lib/rmagick/tti_converter.rb']
  spec.files << 'README.md'
  spec.files << 'LICENSE'
  spec.license = 'MIT'

  spec.add_dependency 'rmagick', '~> 2.15', '>= 2.15.4'
  spec.add_development_dependency 'bundler', '~> 1.10', '>= 1.10.6'
  spec.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  spec.add_development_dependency 'rspec', '~> 3.3'
end


