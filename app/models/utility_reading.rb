class UtilityReading < ApplicationRecord
   def total_cost
    value.to_f * unit_price.to_f
  end

  def self.filter_by(month:, year:, resource: nil)
    scope = where("strftime('%m', date) = ? AND strftime('%Y', date) = ?", month.to_s.rjust(2, '0'), year.to_s)
    scope = scope.where(resource: resource) if resource
    scope
  end
end
