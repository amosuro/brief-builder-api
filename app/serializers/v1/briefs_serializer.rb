module V1
  class BriefsSerializer < ActiveModel::Serializer

    attributes :title, :created_at, :id
    has_one :user, serializer: V1::UserSerializer

  end
end
