class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]
  around_action :switch_locale

  def index
    @products = Product.all
  end

  def show
    # 없으면 에러
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    begin
      @product = Product.find(params[:id]) # db query
    rescue ActiveRecord::RecordNotFound
      redirect_to products_path, notice: "Product not found"
    end
  end

  def product_params
    params.expect(product: [ :name, :description, :featured_image, :inventory_count ])
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
