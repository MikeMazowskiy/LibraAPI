module Api
  class BaseController < ApplicationController
    def jsonapi_errors(errors, code = 422)
      errors =
        if errors.is_a? Array
          errors.map { |title| {title:, status: code} }
        else
          errors.map { |title, status| {title:, status:} }
        end

      render json: {errors:}, status: code
    end
  end
end
