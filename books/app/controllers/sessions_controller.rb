class SessionsController < ApplicationController
  def new

  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Erfolgreich eingeloggt"
      redirect_to authors_url
    else
      render :new
      flash[:notice] = "Fehler"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to authors_url, notice: "Erflogreich ausgeloggt"
  end
end
