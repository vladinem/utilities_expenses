Rails.application.routes.draw do

  root "dashboard#index"
  get "reports/yearly", to: "reports#yearly", as: :yearly_report
  get "reports/monthly"
  resources :utility_readings
  resources :material_purchases
  # Новый маршрут
  get "monthly_reports", to: "reports#monthly", as: :monthly_reports
end
