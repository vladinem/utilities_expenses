class UtilityReadingsController < ApplicationController
  def index
    @utility_readings = UtilityReading.order(date: :desc)
  end

  def new
    @utility_reading = UtilityReading.new
  end

  def create
    @utility_reading = UtilityReading.new(utility_reading_params)
    if @utility_reading.save
      redirect_to utility_readings_path, notice: "Запись добавлена"
    else
      render :new
    end
  end

  def show
    @utility_reading = UtilityReading.find(params[:id])
  end

  def edit
  Rails.logger.debug "ID из параметров: #{params[:id]}"
  @utility_reading = UtilityReading.find_by(id: params[:id])
  if @utility_reading.nil?
    redirect_to utility_readings_path, alert: "Запись не найдена"
  end
end


 def update
  @utility_reading = UtilityReading.find(params[:id])

  if @utility_reading.update(utility_reading_params)
    redirect_to utility_readings_path, notice: "Запись успешно обновлена"
  else
    render :edit, status: :unprocessable_entity
  end
end

# def update
#   @utility_reading = UtilityReading.find(params[:id])
#   if @utility_reading.update(utility_reading_params)
#     redirect_to utility_readings_path, notice: "Запись обновлена"
#   else
#     render :edit
#   end
# end

def destroy
  @utility_reading = UtilityReading.find(params[:id])
  @utility_reading.destroy
  redirect_to utility_readings_path, notice: "Запись удалена"
end

  private

  def utility_reading_params
    params.require(:utility_reading).permit(:resource, :date, :value, :unit_price)
  end
end
