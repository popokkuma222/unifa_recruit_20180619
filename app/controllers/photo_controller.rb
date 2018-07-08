require 'net/https'
require 'uri'
require 'json'

class PhotoController < ApplicationController
  def list
    if logged_in?
      @photos = Photo.where(created_by: session[:id]).order('created_at DESC')
    else
      redirect_to root_url
    end
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

  def tweet
    params[:id]
    tweet_photo = Photo.find(params[:id])
    post_body_json = {title: tweet_photo.title, url: "http://localhost:3000/photos/"+ tweet_photo.get_file_name}.to_json
    uri = URI('https://arcane-ravine-29792.herokuapp.com/api/tweets')
    req = Net::HTTP::Post.new(uri)

    req['Content-Type'] = req['Accept'] = 'application/json'
    req['Authorization'] = 'Bearer ' + session[:access_token]
    req.body = post_body_json
    puts '--------------'
    puts req['Content-Type']
    puts req['Authorization']
    puts req.body
    puts uri
    puts uri.host
    puts uri.port
    puts '--------------'
    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') { |http|
      http.set_debug_output $stderr
      http.request(req)
    }
      puts '##############'
      puts res.body
      puts res.code
      puts res
      puts '###############'

    if res.is_a?(Net::HTTPSuccess)
      puts JSON.pretty_generate(JSON.parse(res.body))
    else
      abort 'call api failed: body=' + res.body.to_s
    end
    redirect_to controller: 'photo', action: 'list'
  end
end
