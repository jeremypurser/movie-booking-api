class ApplicationSerializer < ActiveModel::Serializer
  include JwtAuthenticatable
end
