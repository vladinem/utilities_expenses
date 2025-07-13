class MaterialPurchase < ApplicationRecord
  def total_cost
    quantity * unit_price
  end

  def self.filter_by(month:, year:, item: nil)
    scope = where("strftime('%m', date) = ? AND strftime('%Y', date) = ?", month.to_s.rjust(2, '0'), year.to_s)
    scope = scope.where(item: item) if item
    scope
  end
end
