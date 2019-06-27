class Semester < ApplicationRecord
    has_many :students, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    validate :validate_start_date_and_end_date

    def validate_start_date_and_end_date
        if start_date.present? && end_date.present? && (start_date > end_date)
            errors.add(:base, "Start date can not be greater than end date.") 
        end
    end

    def self.create_semester(params,current_user_id)
        semester = Semester.new(params[:semester])
        semester.assign_attributes(created_by_id:current_user_id,updated_by_id:current_user_id)
        semester.save
        return semester
    end

end
