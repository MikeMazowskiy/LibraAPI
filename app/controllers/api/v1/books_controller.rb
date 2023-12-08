module Api
  module V1
    class BooksController < Api::BaseController
      def index
        render json: BookSerializer.new(Book.all)
      end

      def show
        object = Book.find(params[:id])
        render json: BookSerializer.new(object)
      end

      def create
        object = Book.new permitted_params

        if object.save
          render json: BookSerializer.new(object)
        else
          jsonapi_errors(object.errors.full_messages)
        end
      end

      def update
        object = Book.find(params[:id])

        if object.update permitted_params
          render json: BookSerializer.new(object)
        else
          jsonapi_errors(object.errors.full_messages)
        end
      end

      def destroy
        object = Book.find(params[:id])

        if object.destroy
          render json: BookSerializer.new(object)
        else
          jsonapi_errors(object.errors.full_messages)
        end
      end

      private

      def permitted_params
        params.require(:book).permit(:name, :list_ids, :author)
      end
    end
  end
end