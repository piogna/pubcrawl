helpers do

  def current_user
    session["user_id"]
  end

  def user_authenticated?
    session["user_id"] && User.find_by(id: session["user_id"])
  end

  def redirect_if_not_authenticated
    redirect '/sessions/login' unless user_authenticated?
  end

end