class Hourly 
  attr_reader :time,
              :temperature,
              :conditions,
              :icon
              
  def initialize(hourly)
    @time = hourly[:time].split[1]
    @temperature = hourly[:temp_f]
    @conditions = hourly[:condition][:text]
    @icon = hourly[:condition][:icon]
  end
end