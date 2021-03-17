# frozen_string_literal: true

module Api::V1
  class MovieSerializer < ApplicationSerializer
    attributes :id, :name, :runtime, :buffer, :details
  end
end
