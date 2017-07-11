class Experience
  attr_accessor :start_time, :end_time, :details, :job_title, :student_id, :company
   def initialize(hash)
    @student_id = hash["student_id"]
    @start_time = hash["start_time"]
    @end_time = hash["end_time"]
    @details = hash["details"]
    @company = hash["company"]
  end
end