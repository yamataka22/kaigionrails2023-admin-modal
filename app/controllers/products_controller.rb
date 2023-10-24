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
      flash.now[:notice] = "更新しました"
      @turbo_path = product_path(@product)
    else
      flash.now[:alert] = "入力内容をご確認ください"
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash.now[:notice] = "更新しました"
      @turbo_path = product_path(@product)
    else
      flash.now[:alert] = "入力内容をご確認ください"
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    flash.now[:notice] = "削除しました"
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
