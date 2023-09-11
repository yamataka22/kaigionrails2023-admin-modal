class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all.order(id: :desc)
    params[:search]&.each do |key, value|
      @products = @products.send(key, value)
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      _flash = "Product was successfully created."
      respond_to do |format|
        format.html { redirect_to product_path(@product), notice: _flash }
        format.turbo_stream do
          flash.now[:notice] = _flash
          @turbo_path = product_path(@product)
        end
      end
    else
      flash.now[:alert] = "Product was unsuccessfully created."
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product.update(product_params)
      _flash = "Product was successfully updated."
      respond_to do |format|
        format.html { redirect_to product_path(@product), notice: _flash }
        format.turbo_stream do
          flash.now[:notice] = _flash
          @turbo_path = product_path(@product)
        end
      end
    else
      flash.now[:alert] = "Product was unsuccessfully updated."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :category, :stock, :price, :description, :status, :sale_start_date, :memo)
    end
end
