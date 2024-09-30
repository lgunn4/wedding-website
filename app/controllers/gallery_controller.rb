class GalleryController < ApplicationController
    def index
      @images = Dir.glob("public/images/gallery/*").map do |file|
        file.sub('public', '')
      end
    end
  end