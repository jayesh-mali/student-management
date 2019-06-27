require 'rails_helper'

RSpec.describe Student, type: :model do
      
  it 'is not valid without a name' do
    student = Student.new(age:25,dob:Time.now-25.years,description:"test description",semester_id:1,created_by_id:1,updated_by_id:1)
    expect(student).to_not be_valid
  end

  it 'is not valid without semester' do
    student = Student.new(name:"test",age:25,dob:Time.now-25.years,description:"test description",created_by_id:1,updated_by_id:1)
    expect(student).to_not be_valid
  end

end
