class ProductsController < ActionController::Base
  def index
    @products = Product.all
  end

  def new
    @product = Product.create

    @product = Product.new(product_params)
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to category_path(@product.category_id)
    else
      redirect_to category_path(params[:category_id])
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :price)
  end

end
