class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def like_text
    like =Like.where(pelicula: Pelicula.find(params[:id].to_i), user: current_user)
    
    if like ==[]
  #crear favorito
     
      @like_exist = true
    else
      #borrar favorito
      like.destroy_all
      @like_exist = false
    end
    
  

  	return @like_exist ? "favorito" : "no favorito"
  end
  helper_method :like_text
end
