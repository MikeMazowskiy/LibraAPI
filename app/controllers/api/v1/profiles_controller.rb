module Api
  module V1
    class ProfilesController < Api::BaseController
      def index
        render json: ProfileSerializer.new(Profile.all)
      end

      def show
        object = Profile.find(params[:id])
        render json: ProfileSerializer.new(object)
      end

      def create
        object = Profile.new permitted_params

        if object.save
          render json: ProfileSerializer.new(object)
        else
          jsonapi_errors(object.errors.full_messages)
        end
      end

      def update
        object = Profile.find(params[:id])

        if object.update permitted_params
          render json: ProfileSerializer.new(object)
        else
          jsonapi_errors(object.errors.full_messages)
        end
      end

      def destroy
        object = Profile.find(params[:id])

        if object.destroy
          render json: ProfileSerializer.new(object)
        else
          jsonapi_errors(object.errors.full_messages)
        end
      end

      private

      def permitted_params
        params.require(:profile).permit(:nick_name, :full_name, :age, :user_id, :author)
      end
    end
  end
end
