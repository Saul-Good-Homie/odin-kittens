class KittensController < ApplicationController

    def index
        @kittens = Kitten.all
    end
    
    def show
        @kitten = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end
    
    def create
        @kitten = Kitten.new(kitten_params)
        @kitten.save
        flash.notice = "New Kitten added!"

        redirect_to kitten_path(@kitten)
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy
        flash.notice = "Kitten '#{@kitten.name}' has been removed."

        redirect_to kittens_path
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])
        @kitten.update(kitten_params)
        flash.notice = "Kitten '#{@kitten.name}' Updated!"

        redirect_to kitten_path(@kitten)
    end


private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
