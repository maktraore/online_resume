class Experience
  attr_accessor :start_time, :end_time, :details, :job_title, :student_id, :company
   def initialize(hash)
    @student_id = hash[:student_id]
    @start_time = hash[:start_time]
    @end_time = hash[:end_time]
    @details = hash[:details]
    @company = hash[:company]
  end

  def self.where(input)
    array_experiences = []
    experiences_hash = Unirest.get("#{ENV['API_BASE_URL']}/#{input[:student_id]}/experiences.json").body
    # binding.pry
    experiences_hash.each do |experience|
      array_experiences << Experience.new(start_date: experience["start_date"], end_time: experience["end_time"], job_title: experience["job_title"], company: experience["company"], details: experience["details"], student_id: experience["student_id"]
        )
    end
    array_experiences
  end
end