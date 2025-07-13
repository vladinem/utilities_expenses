class MaterialPurchasesController < ApplicationController
  def index
    @material_purchases = MaterialPurchase.order(date: :desc)
  end

  def new
    @material_purchase = MaterialPurchase.new
  end

  def create
    @material_purchase = MaterialPurchase.new(material_purchase_params)
    if @material_purchase.save
      redirect_to material_purchases_path, notice: "Покупка добавлена"
    else
      render :new
    end
  end

  def show
    @material_purchase = MaterialPurchase.find(params[:id])
  end

  def edit
  @material_purchase = MaterialPurchase.find(params[:id])
  end

  def update
    @material_purchase = MaterialPurchase.find(params[:id])
    if @material_purchase.update(material_purchase_params)
    redirect_to material_purchases_path, notice: "Запись обновлена"
    else
      render :edit
    end
  end

  def destroy
    @material_purchase = MaterialPurchase.find(params[:id])
    @material_purchase.destroy
    redirect_to material_purchases_path, notice: "Запись удалена"
  end

  private

  def material_purchase_params
    params.require(:material_purchase).permit(:item, :date, :quantity, :unit_price)
  end
end
