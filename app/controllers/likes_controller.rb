class LikesController < ApplicationController
    def index
      
    end
   def update
      like =Like.where(pelicula: Pelicula.find(params[:pelicula]), user: current_user)
    
      if like ==[]
    #crear favorito
        Like.create(pelicula: Pelicula.find(params[:pelicula]),user: current_user)
        @like_exist = true
      else
        #borrar favorito
        like.destroy_all
        @like_exist = false
      end
     
    redirect_to peliculas_path
  end
end
