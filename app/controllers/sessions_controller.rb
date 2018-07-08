class SessionsController < ApplicationController
  def new
  end

  def create
    bln_error = false
    message_dict = 
    unless params[:session][:user_id].present?
	    print("user_id_error")
      flash[:user_id_error] = "ユーザIDを入力してください"
      bln_error = true
    end
    unless params[:session][:password].present?
	    print("password error")
      flash[:password_error] = "パスワードを入力してください"
      bln_error = true
    end
    if bln_error
	print("error exist")
      render "new"
    else
      user = User.find_by(user_id: params[:session][:user_id])
      if user && user.authenticate(params[:session][:password])
        # ユーザーログイン後にユーザー情報のページにリダイレクトする
        log_in user
	session[:id] = user.id
        redirect_to controller: 'photo', action: 'list'
      else
        # エラーメッセージを作成する
        flash[:error] = 'Invalid user_id/password combination' # 本当は正しくない    
        render 'new'
      end
    end
  end

  def destroy
  end


end
