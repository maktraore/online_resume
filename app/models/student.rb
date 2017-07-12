class Student
  attr_accessor :id, :first_name, :last_name, :email, :bio, :linkedin, :twitter, :personal_url, :resume_url, :github_url, :avatar, :phone

  HEADER = { "Accept" => "application/json", "X-User-Email" => ENV['EMAIL'], "Authorization" => "Token token=#{ENV['API_KEY']}" }

  def initialize(hash)
    @id = hash["id"]
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @phone = hash["phone"]
    @email = hash["email"]
    @bio = hash["bio"]
    @linkedin = hash["linkedin"]
    @twitter = hash["twitter"]
    @personal_url = hash["personal"]
    @resume_url = hash["resume"]
    @github_url = hash["github"]
    @avatar = hash["avatar"]
  end

  def self.all
    api_students = Unirest.get("#{ENV['API_BASE_URL']}.json").body
    array_students = []
    api_students.each do |student|
      array_students << Student.new(student)
    end
    array_students
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def self.find_by(input)
    hash = Unirest.get("#{ENV['API_BASE_URL']}/#{input[:id]}.json", headers: HEADER).body
    Student.new(hash)
  end

  def skills
    Skill.where(student_id: self.id)
  end

  def experiences
    Experience.where(student_id: self.id)
  end

  def educations
    Education.where(student_id: self.id)
  end
  def capstone
    Capstone.where(student_id: self.id)
  end
end
