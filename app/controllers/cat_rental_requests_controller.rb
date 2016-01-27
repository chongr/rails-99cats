class CatRentalRequestsController < ApplicationController

  def new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cat_url(Cat.find_by(id: cat_rental_request_params[:cat_id]))
    else
      fail "What"
    end
  end

  def update
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    @cat = @cat_rental_request.cat
    @cat_rental_request.approve!
    redirect_to cat_url(@cat)
  end

  def deny
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    @cat = @cat_rental_request.cat
    @cat_rental_request.deny!
    redirect_to cat_url(@cat)
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end

end
