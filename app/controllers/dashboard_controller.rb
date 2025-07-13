class DashboardController < ApplicationController
  def index
  @new_utility_reading = UtilityReading.new
  @new_material_purchase = MaterialPurchase.new

  month = params[:month].to_i
  year = params[:year].to_i

  if month > 0 && year > 0
    start_date = Date.new(year, month, 1)
    end_date = start_date.end_of_month

    @utility_readings = UtilityReading.where(date: start_date..end_date).order(date: :desc)
    @material_purchases = MaterialPurchase.where(date: start_date..end_date).order(date: :desc)
  else
    @utility_readings = UtilityReading.order(date: :desc)
    @material_purchases = MaterialPurchase.order(date: :desc)
  end
end

end
