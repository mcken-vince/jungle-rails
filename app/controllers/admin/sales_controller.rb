class Admin::SalesController < ApplicationController
  http_basic_authenticate_with :name => ENV['ADMIN_USER'], :password => ENV['ADMIN_PASS']
  
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to [:admin, :sales], notice: 'Sale created!'
    else
      render :new
    end
  end

  def destroy
    @sale = Sale.find params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], notice: 'Product deleted!'
  end

  private

  def sale_params
    params.require(:sale).permit(:name, :starts_on, :ends_on, :percent_off)
  end

end
