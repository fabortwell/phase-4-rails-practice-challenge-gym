class GymsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :raise_record_not_found
    
      def index
        render json: Gym.all
      end
    
      def show
        render json: find_gym, status: :ok
      end
    
      def update
        updated = find_gym.update(gym_params)
        if updated
          render json: find_gym
        else
          render json: { error: "Could not update record" }, status: :forbidden
        end
      end
    
      def destroy
        find_gym.destroy
        render json: {}, status: :ok
      end
    
      private
    
      def find_gym
        Gym.find(params[:id])
      end
    
      def gym_params
        params.require(:gym).permit(:name, :address)
      end
    
      def raise_record_not_found
        render json: { error: "Gym not found" }, status: :not_found
      end
    end