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

    def to_ascii
      images.map(&:to_ascii)
    end
  end

  class GalleryImage
    DEFAULT_WIDTH = 100

    attr_accessor :url

    def initialize(params)
      @params = params
      self.url = params[:url]
    end

    def to_ascii(width=nil)
      width ||= DEFAULT_WIDTH
      HTTParty.get("#{ascii_url}&width=#{width}").split("\n")
    end

    def ascii_url
      "http://skeeter.blakesmith.me/?image_url=#{url}"
    end
  end
end
