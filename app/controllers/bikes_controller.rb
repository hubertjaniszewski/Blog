class BikesController < ApplicationController
    
    def index
        @bikes = Bike.all
    end
  
    def new
        @bike = Bike.new
    end

    def create
        @bike = Bike.new(bike_params)
        #@bike = Bike.new(bike_params)
        #@bike.save
        #redirect_to bikes_path(@bike) 
        if @bike.save
            flash[:notice] = "Bike was successfully built"
            redirect_to bike_path(@bike)
        else
            render 'new'
        end    
    end
    
    def show
        @bike = Bike.find(params[:id])
    end

    def edit
        @bike = Bike.find(params[:id])
    end

    def update
        @bike = Bike.find(params[:id])
        if @bike.update(bike_params)
            flash[:notice] = "Bike was successfully edited"
            redirect_to bike_path(@bike)
        else
            render 'edit'
        end
    end

    def destroy
        @bike = Bike.find(params[:id])
        @bike.destroy
        flash[:notice] = "Bike was successfully destroyed"
        redirect_to bikes_path
    end

    

    private
    def bike_params
        params.require(:bike).permit(:brand, :wheels, :color, :year_of_production)
    end
end