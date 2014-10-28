class ProductsController < ApplicationController
  before_filter :load_store
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = @store.products.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = @store.products.find(params[:id])
  end

  # GET /products/new
  def new
    @product = @store.products.new
  end

  # GET /products/1/edit
  def edit
    @product = @store.products.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create

    @product = @store.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to [@store, @product], notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = @store.products.find(params[:id])

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [@store, @product], notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = @store.products.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to store_products_path(@store), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  #a way to call the store
def load_store
  @store = Store.find(params[:store_id])
end 

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = @store.products.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price)
    end
end
