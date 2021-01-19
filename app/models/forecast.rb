class Forecast < ApplicationRecord
  has_many :weathers

  def current
    weathers.find_by(forecast_type: 'current')
  end

  def daily
    weathers.where(forecast_type: 'daily')
  end

  def hourly
    weathers.where(forecast_type: 'hourly')
  end
end
