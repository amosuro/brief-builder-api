module V1
  class BriefSerializer < ActiveModel::Serializer

    attributes :title, :created_at, :id
    has_one :user, serializer: V1::UserSerializer

  end
end
