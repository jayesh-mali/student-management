class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :semester

  class SemesterSerializer < ActiveModel::Serializer
    attributes :id, :name, :credits
  end

end
