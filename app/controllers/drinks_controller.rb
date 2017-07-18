class DrinksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Drink.all
  end

  def create
    if Drink.where(name: drink_params[:name]).first
      render json: {drink_not_saved: "Drink already exists"}
      return
    end
    drink = Drink.new(drink_params)
    if drink.save
      render json: {drink_saved: drink_params}
    else
      render json: {drink_not_saved: "error"}
    end
  end

  def destroy
    if Drink.where(id: params[:id]).first
      drink_to_destroy = Drink.find(params[:id])
    else
      render json: "Failure to destroy drink ##{params[:id]}"
      return
    end
    if Drink.destroy(params[:id])
      render json: {"The following drink has been destroyed:": drink_to_destroy}
    else
      render json: "Failure to destroy drink ##{params[:id]}"
    end
  end

  def destroy_all
    if params[:yesIWantToDestroy] == "ALL"
      Drink.destroy_all
      render json: {"Destroy all": "Success!"}
    else
      render json: {"I'dLoveToDestroyAllBut": "YouLackAuthorita"}
    end
  end

  private
  def drink_params
    params.require(:drink).permit(:name, :glass, :category, :garnish, :preparation, :ingredients, :amounts, :units)
  end
end
