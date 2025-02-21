class GalleryController < ApplicationController
  layout 'styled'

  def index
    all_images = Dir.glob("public/images/gallery/*").map do |file|
      file.sub('public', '')
    end
    @images = Kaminari.paginate_array(all_images).page(params[:page]).per(15)
  end
end