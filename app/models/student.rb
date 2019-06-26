class Student < ApplicationRecord
    belongs_to :semester
    validates :name, presence: true

    def self.create_student(params,current_user_id)
        student = Student.new(params[:student])
        semester = Semester.find_by_name(params[:semester][:name])
        if semester.nil?
            student.errors.add(:base, "Semester with name #{params[:semester][:name]} not found") 
        else
            student.assign_attributes(semester_id:semester.id,created_by_id:current_user_id,updated_by_id:current_user_id)
            student.save
        end
        return student
    end

end
