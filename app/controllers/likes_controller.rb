class LikesController < ApplicationController


    before_action :set_like, only: [:show, :edit, :update, :destroy, ]
 

    def index
      @like = Like.all
    
    end
  
    def show
  
   
     end
     
       def new 
        @like = Like.new 
        @pelicula = Pelicula.all.map{|c| [ c.title, c.id ] }
      end
    
    
  
  
    def edit
    end
  
    def create
      
      @like = Like.new(like_params)  
      if    @like.save
     
        redirect_to likes_path 
       
      else
        
        redirect_to new_like_path
     end
    end
  
  
    def update
      respond_to do |format|
        if @like.update(like_params)
          format.html { redirect_to @like, notice: 'yei ' }
         
        else
          format.html { render :edit }
          
        end
      end
    end
  
    
    def destroy
      @like.destroy
      respond_to do |format|
        format.html { redirect_to likes_url, notice: 'Pelicula was successfully destroyed.' }
        end
    end
  
    private
     
      def set_like
        @like = Like.find(params[:id])
      end
  
     
      def like_params
        params.require(:like).permit(:title, :description).merge(pelicula_id: params[:pelicula].to_i)
  
      end
  

end
