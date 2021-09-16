class Admin::SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def new
    sale = Sale.new
  end

  def destroy
    @sale = Sale.find params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], notice: 'Product deleted!'
  end

end
