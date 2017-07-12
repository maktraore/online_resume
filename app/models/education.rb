class Education
  attr_accessor :start_date, :end_date, :details, :degree, :university_name, :student_id

  def initialize(hash)
    @student_id = hash[:student_id]
    @start_date = hash[:start_date]
    @end_date = hash[:end_date]
    @details = hash[:details]
    @degree = hash[:degree]
    @university_name = hash[:university_name]
  end

   def self.where(input)
    array_educations = []
    educations_hash = Unirest.get("#{ENV['API_BASE_URL']}/#{input[:student_id]}/educations.json").body
    educations_hash.each do |education|
      array_educations << Education.new(start_date: education["start_date"], end_date: education["end_date"], details: education["details"], degree: education["degree"], university_name: education["university_name"], student_id: education["student_id"])
    end
    array_educations
  end
end