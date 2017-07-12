class Skill
  attr_accessor :student_id, :name

  def initialize(hash)
    @student_id = hash[:student_id]
    @name = hash[:name]
  end

  def self.where(input)
    array_skills = []
    @skills = Unirest.get("#{ENV['API_BASE_URL']}/#{input[:student_id]}/skills.json").body
    @skills.each do |skill|
      array_skills << Skill.new(name: skill["name"], student_id: skill["student_id"])
    end
    array_skills
  end
end