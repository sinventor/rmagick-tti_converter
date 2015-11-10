require 'rmagick'
require 'rmagick/tti_converter/version'
require 'fileutils'

module Magick
  class TTIConverter

    # Creates a TTIConverter object. +path+ is the path for
    # images that will generate.

    def initialize(path)
      if path.match(/\A[.]{0,2}[a-zA-Z0-9\/\-_]+\z/)
        @path = path
      else
        @path = "tmp/"
      end
      FileUtils.mkdir_p(@path) unless File.exists?(@path)
      @line_width = 80
    end

    # Generates an image with text contents.
    #
    # +text+ is the string that shoulld be converted to image
    #
    # Options:
    #
    # +file_name+ - The file name that will be assigned for image
    # +optimal_width+ - The width attribute for maximum length of the string into one line.
    # If +optimal_width+ not in between 40 or 160 then it set to 80

    def make_image(text, options = {})
      file_name = options[:file_name] || "image.jpg"
      optimal_width = options[:optimal_width] &&
                      options[:optimal_width].between?(40, 160) ? 
                      options[:optimal_width] : 80
      @line_width = optimal_width
      image = Magick::Image.new(50,50)
      draw = Magick::Draw.new
      draw.fill("hsla(90%, 20%, 10%, 1.0)")
      start = 0
      finish = optimal_width
      positions = []
      edited_text = text.dup

      while positions.length < text.length.to_f / optimal_width + 1
        number_and_new_line_option = get_index_and_new_line_option_for_nearest_space(text, { 
                          start:  start,
                          finish: finish
                        })
        if number_and_new_line_option[0] != -1
          positions << number_and_new_line_option
          start = number_and_new_line_option[0] + 1
          finish = number_and_new_line_option[0] + optimal_width
        else
          positions << number_and_new_line_option
          start = start + optimal_width + 1
          finish = start + optimal_width
        end
      end

      positions.each { |pos| edited_text[pos[0]] = "\n" if pos[1] }
      current_metrics = draw.get_multiline_type_metrics(image, edited_text)
      width = current_metrics.width
      height = current_metrics.height
      image = Magick::Image.new(width + 25, height + 35)
      draw.text(15, 25, edited_text)
      draw.draw(image)
      image.write(@path + file_name)
    end

    private

    def get_index_and_new_line_option_for_nearest_space(text, options = {})
      start = options[:start] || 0
      finish = options[:finish] || (start + @line_width)
      current_pos = finish

      loop do
        return [-1, true] if current_pos - start < 0
        return [current_pos, true] if text[current_pos] == " "
        return [current_pos, false] if text[current_pos] == "\n"
        current_pos -= 1
      end
    end
  end
end