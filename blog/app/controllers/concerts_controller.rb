class ConcertsController < ApplicationController
	def index
      @concerts = Concert.all
    end
    def show
        @concert = Concert.find(params[:id])
    end

    def new
   		@concert = Concert.new
  	end

    def create
     	@concert = Concert.new(concert_params)
     	@concert.save
     	redirect_to concert_path(@concert)
  	end



    def like
      @concert = Concert.find(params[:id])
      @concert.likes = @concert.likes + 1;
      @concert.save
  
      @concert = Concert.find(params[:id])
      render :show 
    end


    def top
       @concert = Concert.order(:likes)
    end

 private
     def concert_params
          params.require(:concert).permit(:band_name, :venue, :city, :date, :price, :description)
     end

end
