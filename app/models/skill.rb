class Skill
  attr_accessor :skill_id, :name

  def initialize(hash)
    @student_id = hash["student_id"]
    @name = hash["name"]
  end
end