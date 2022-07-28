class ClientSerializer < ActiveModel::Serializer
    attributes :id, :name, :age, :total_membership
  end