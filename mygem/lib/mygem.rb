require "mygem/version"
require "httparty"
require "googleajax"
GoogleAjax.referrer = 'localhost'

module Asciify
  def self.generate_gallery(message)
    result = GoogleAjax::Search.images(message)[:results]
    Gallery.new(result)
  end

  class Gallery
    attr_accessor :images
    def initialize(results)
      self.images = results.map do |result|
        GalleryImage.new(result)
      end
    end
  end

  class GalleryImage
    attr_accessor :url
    def initialize(params)
      @params = params
      self.url = params[:url]
    end

    def to_ascii(width = 30)
      return @ascii if @ascii

      ascii_url = "http://skeeter.blakesmith.me/?image_url=#{url}&width=#{width}"
      @ascii = HTTParty.get(ascii_url).split("\n")
    end
  end
end
