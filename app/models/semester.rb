class Semester < ApplicationRecord
    has_many :students, dependent: :destroy
    validates :name, presence: true, uniqueness: true


    def self.create_semester(params,current_user_id)
        semester = Semester.new(params[:semester])
        semester.assign_attributes(created_by_id:current_user_id,updated_by_id:current_user_id)
        semester.save
        return semester
    end

end
