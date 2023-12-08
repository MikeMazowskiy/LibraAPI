module Api
  module V1
    class ReviewsController < Api::BaseController
      def index
        render json: ReviewSerializer.new(Review.all)
      end

      def show
        object = Review.find(params[:id])
        render json: ReviewSerializer.new(object)
      end

      def create
        object = Review.new permitted_params

        if object.save
          render json: ReviewSerializer.new(object)
        else
          jsonapi_errors(object.errors.full_messages)
        end
      end

      def update
        object = Review.find(params[:id])

        if object.update permitted_params
          render json: ReviewSerializer.new(object)
        else
          jsonapi_errors(object.errors.full_messages)
        end
      end

      def destroy
        object = Review.find(params[:id])

        if object.destroy
          render json: ReviewSerializer.new(object)
        else
          jsonapi_errors(object.errors.full_messages)
        end
      end

      private

      def permitted_params
        params.require(:review).permit(:text, :profile_id, :book_id)
      end
    end
  end
end