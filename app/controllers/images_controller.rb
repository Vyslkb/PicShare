class ImagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  require 'mini_Magick'

  #all user images
  def index
    #if user signed in show them their own images
    if user_signed_in?
      @images = current_user.images.all
      respond_with(@images)
    end
  end

  # shows one specific image
  def show

    respond_with(@image)
  end

  #creates new image

  def new
    @image = current_user.images.new
    respond_with(@image)
  end

  #edit existing image
  def edit

  end

  #creates the image and saves

  def create
    @image =current_user.images.new(image_params)
    @image.save
    respond_with(@image)
  end

  #called by edit to change attricbutes of image
  def update

@image.update(image_params)

    

      filter = Filter.find(params[:filter][:id])
      image = Image.find(params[:id])
      
      
      img = MiniMagick::Image.new(@image.photo.path)
      # Applies the filters.
      if filter.blur != nil
      img = img.blur_image(filter.blur)
      end
      if filter.blue_shift != nil
      img = img.blue_shift(filter.blue_shift)
      end
      if filter.charcoal != nil
      img = img.charcoal(0,filter.charcoal)
      end


    
    respond_with(@image)
  end

  #delete image from server

  def destroy
    @image.destroy
    respond_with(@image)
  end

  private

  def set_image
    @image =current_user.images.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:description,:photo)
  end
end
