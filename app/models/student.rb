class Student
  attr_accessor :id, :first_name, :last_name, :email, :bio, :link_in, :twitter, :personal_url, :resume_url, :github_url, :avatar

  HEADER = { "Accept" => "application/json", "X-User-Email" => ENV['EMAIL'], "Authorization" => "Token token=#{ENV['API_KEY']}" }

  def initialize(hash)
    @id = hash["id"]
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
    @bio = hash["bio"]
    @link_in = hash["link_in"]
    @twitter = hash["twitter"]
    @personal_url = hash["personal_url"]
    @resume_url = hash["resume_url"]
    @github_url = hash["github_url"]
    @avatar = hash["avatar"]
    @skills_hash = hash["skills"]
    @experiences_hash = hash["experiences"]
  end

  def self.all
    api_students = Unirest.get("#{ENV['URL']}.json", headers: HEADER).body
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
    hash = Unirest.get("#{ENV['URL']}/#{input[:id]}.json", headers: HEADER).body
    Student.new(hash)
  end

  def skills
    array_skills = []
    @skills_hash.each do |skill|
      array_skills << Skill.new(name: skill["name"], student_id: skill["student_id"])
    end
  end

  def experiences
    array_experiences = []
    @experiences_hash.each do |experience|
      array_experiences << Experience.new(start_date: experience["start_date"], end_time: experience["end_time"], job_title: experience["job_title"], company: experience["company"], details: experience["details"], student_id: experience["student_id"]
        )
    end
  end

  def educations
    array_educations = []
    @educations_hash.each do |education|
      array_educations << Education.new(start_date: education["start_date"], end_date: education["end_date"], details: education["details"], degree: education["degree"], university_name: education["university_name"], student_id: education["student_id"])
    end
  end
  def capstone
    array_capstone = []
    @capstones_hash.each do |capstone|
      array_capstone << Capstone.new(name: capstone["name"], description: capstone["description"], url: capstone["url"], screenshot:capstone["screenshot"])
    end
  end
end
