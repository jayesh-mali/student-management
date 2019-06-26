class SemesterSerializer < ActiveModel::Serializer
  attributes :id, :name, :credits, :start_date, :end_date
end
