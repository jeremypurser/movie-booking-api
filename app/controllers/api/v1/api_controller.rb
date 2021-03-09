module Api
  module V1
    class ApiController < ApplicationController
      include Authorization

      before_action :authorized
    end
  end
end
