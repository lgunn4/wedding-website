class GalleriesController < ApplicationController
  def show
    @images = Dir.glob("public/images/gallery/*").map do |file|
      file.sub('public', '')
    end
  end
end