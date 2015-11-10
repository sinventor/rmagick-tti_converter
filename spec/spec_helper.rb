$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rmagick/tti_converter'
require 'fileutils'

RSpec.configure do |config|
  config.after(:all) do
    FileUtils.rm_rf(Dir["./tmp"])
  end
end
