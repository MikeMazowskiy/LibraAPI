module Api
  module V1
    class ListsController < Api::BaseController
      def index
        render json: ListSerializer.new(List.find_by(user_id: current_user.id).lists)
      end

      def show
        object = List.find(params[:id])
        render json: ListSerializer.new(object)
      end

      def update
        object = List.find(params[:id])
        object.books << Book.find(permitted_params[:book_ids])

        if object.save
          render json: ListSerializer.new(object)
        else
          jsonapi_errors(object.errors.full_messages)
        end
      end

      private

      def permitted_params
        params.require(:lists).permit(:name, :book_ids, :profile_id)
      end
    end
  end
end