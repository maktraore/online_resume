class Capstone
  attr_accessor :name, :description, :url, :screenshot, :student_id
  def initialize(hash)
    @student_id = hash[:student_id]
    @name = hash[:name]
    @description = hash[:description]
    @url = hash[:url]
    @screenshot = hash[:screenshot]
  end

   def self.where(input)
    array_capstones = []
    capstones_hash = Unirest.get("#{ENV['API_BASE_URL']}/#{input[:student_id]}/capstones.json").body
    capstones_hash.each do |capstone|
      array_capstones << Capstone.new(name:capstone["name"], description:capstone["description"], url:capstone["url"], screenshot:capstone["screenshot"], student_id: capstone["student_id"])
    end
    array_capstones
  end
end