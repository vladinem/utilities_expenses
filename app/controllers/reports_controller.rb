class ReportsController < ApplicationController
  def monthly
    @month = params[:month].to_i.nonzero? || Date.today.month
    @year  = params[:year].to_i.nonzero?  || Date.today.year

    @utility_readings = UtilityReading.where("strftime('%m', date) = ? AND strftime('%Y', date) = ?", @month.to_s.rjust(2, '0'), @year.to_s)
    @material_purchases = MaterialPurchase.where("strftime('%m', date) = ? AND strftime('%Y', date) = ?", @month.to_s.rjust(2, '0'), @year.to_s)

    @total_utilities = @utility_readings.sum(&:total_cost)
    @total_materials = @material_purchases.sum(&:total_cost)
    @grand_total = @total_utilities + @total_materials

    # @total_utilities = @utility_readings.sum("value * unit_price")
    # @total_materials = @material_purchases.sum("quantity * unit_price")
    # @grand_total = @total_utilities + @total_materials
  end

  def yearly
    @year = params[:year].to_i.nonzero? || Date.today.year

    @utility_readings = UtilityReading.where("strftime('%Y', date) = ?", @year.to_s)
    @material_purchases = MaterialPurchase.where("strftime('%Y', date) = ?", @year.to_s)

    @total_utilities = @utility_readings.sum("value * unit_price")
    @total_materials = @material_purchases.sum("quantity * unit_price")
    @grand_total = @total_utilities + @total_materials
  end
end
