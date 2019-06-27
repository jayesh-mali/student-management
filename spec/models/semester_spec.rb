require 'rails_helper'

RSpec.describe Semester, type: :model do
  describe 'user validation' do
    
    it 'is valid with valid parameters' do
      semester = Semester.new(name:"test",credits:"40",start_date:Time.now,end_date:(Time.now+4.day),created_by_id:1,updated_by_id:1)
      expect(semester).to be_valid
    end

    it 'is not valid without a name' do
      semester = Semester.new(credits:"40",start_date:Time.now,end_date:(Time.now+4.day),created_by_id:1,updated_by_id:1)
      expect(semester).to_not be_valid
    end

    it 'is not valid when start date is greater than end date' do
      semester = Semester.new(credits:"40",start_date:Time.now,end_date:(Time.now-4.day),created_by_id:1,updated_by_id:1)
      expect(semester).to_not be_valid
    end

  end
end