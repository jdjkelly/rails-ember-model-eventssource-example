class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :state
end
