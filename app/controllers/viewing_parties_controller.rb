class ViewingPartiesController < ApplicationController
  def new
    if session[:user_id]
      @user = User.find(params[:user_id])
      @movie = Movie.find(params[:movie_id])
    else
      flash[:notice] = 'You must be logged in or registered to create a new viewing party.'
      redirect_to "/users/#{params[:user_id]}/movies"
    end
  end

  def create
    user = User.find(params[:user_id])
    user.viewing_parties.create(viewing_party_params)
    redirect_to "/users/#{params[:user_id]}"
  end

  private

  def viewing_party_params
    params.permit(:movie_id, :duration, :date, :time)
  end
end
