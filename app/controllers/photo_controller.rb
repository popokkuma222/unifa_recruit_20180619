class PhotoController < ApplicationController
  def list
    @photos = Photo.where(created_by: session[:id]).order('created_at DESC')
  end

  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(title: params[:photo][:title], image: params[:photo][:image]) 
    @photo.created_by =  session[:id]
    @photo.extention = File.extname(params[:photo][:image].original_filename) if params[:photo][:image].present? 
    if @photo.save
      # 保存の成功をここで扱う。
      @photo.set_image(params[:photo][:image])
      redirect_to action: 'list'
    else
      render 'new'
    end
  end
end
