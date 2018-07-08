module SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:id] = user.id
  end

  # 現在ログイン中のユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:id)
    @current_user = nil
  end

end
