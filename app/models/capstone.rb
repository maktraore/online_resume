class Capstone
  attr_accessor :name, :description, :url, :screenshot
  def initialize(hash)
    @student_id = hash["student_id"]
    @name = hash["name"]
    @description = hash["description"]
    @url = hash["url"]
    @screenshot = hash["screenshot"]
  end
end