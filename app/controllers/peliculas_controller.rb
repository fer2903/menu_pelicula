class PeliculasController < ApplicationController
	before_action :set_pelicula, only: [:show, :edit, :update, :destroy, :update]
  before_action :authenticate_user!, except: [:index]
 

  def index
    @peliculas = Pelicula.all
    @user_likes = current_user.likes
  
  end
   def update
     
   end
   
  def show
    
    @like_exist = Like.where(pelicula: @pelicula, user: current_user) ? false : true
 
   end
   
     def new 
      @pelicula = Pelicula.new 
      @category = Category.all.map{|c| [ c.name, c.id ] }
    end

  
  


  def edit
  end

  def create
    
    @pelicula = Pelicula.new(pelicula_params)  
    if    @pelicula.save
    @pelicula.update(image: params[:pelicula][:image])
      redirect_to peliculas_path 
     
    else
      
      redirect_to new_pelicula_path
   end
  end


  def update
    respond_to do |format|
      if @pelicula.update(pelicula_params)
        format.html { redirect_to @pelicula, notice: 'yei ' }
       
      else
        format.html { render :edit }
        
      end
    end
  end

  
  def destroy
    @pelicula.destroy
    respond_to do |format|
      format.html { redirect_to peliculas_url, notice: 'Pelicula was successfully destroyed.' }
      end
  end

  private
   
    def set_pelicula
      @pelicula = Pelicula.find(params[:id])
    end

   
    def pelicula_params
      params.require(:pelicula).permit(:title, :description).merge(category_id: params[:category].to_i)

    end

end
