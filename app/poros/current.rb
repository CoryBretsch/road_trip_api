class Current
  attr_reader :last_updated,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :condition,
              :icon

  def initialize(json)
    @last_updated = json[:last_updated]
    @temperature = json[:temp_f] 
    @feels_like = json[:feelslike_f] 
    @humidity = json[:humidity] 
    @uvi = json[:uv] 
    @visibility = json[:vis_miles]
    @condition = json[:condition][:text] 
    @icon = json[:condition][:icon] 
  end
end