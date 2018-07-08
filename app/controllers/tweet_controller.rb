require 'net/https'
require 'uri'

class TweetController < ApplicationController
  def auth
    puts('AUTH!!!!!!!!!!!!!!')

    # URL の組み立て
    url = "https:/arcane-ravine-29792.herokuapp.com/oauth/authorize?"\
      "client_id=e89f8fdc724a190fa6778cda9423c9671bac7194cde48e5af243a828f1eee9f5&"\
      "response_type=code&"\
      "redirect_uri=http://localhost:3000/oauth/callback"


    puts url
#      "state=#{state_token}"

    redirect_to url


  end

  def callback
    print('callback!!')

    if params[:code].present?
    # code を元に token 認証する
      response = Net::HTTP::post_form(URI.parse("https://arcane-ravine-29792.herokuapp.com/oauth/token"), {
            :code => params[:code],
            :client_id => 'e89f8fdc724a190fa6778cda9423c9671bac7194cde48e5af243a828f1eee9f5',
            :client_secret => '5762da1a5406da3d162dd3ac333f01f36897b56a10fe5d3ba50e814db25d3bdd',
            :redirect_uri => "http://localhost:3000/oauth/callback",
            :grant_type => "authorization_code"
          })
      result = JSON.parse(response.body)
      session[:access_token] = result['access_token']
      puts '----------------'
      puts session[:access_token]
      puts '----------------'
  
      redirect_to controller: 'photo', action: 'list'

    end
  
  end

  def tweet
  end
end
