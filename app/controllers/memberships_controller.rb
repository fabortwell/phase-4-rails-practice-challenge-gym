class MembershipsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :raise_unprocessable_entity_exception
      def create
        byebug
        new_membership = Membership.create!(membership_params)
        render json: new_membership, status: :created
      end
    
      private
    
      def membership_params
        params.require(:membership).permit(:gym_id, :client_id, :charge)
      end
    
      def raise_unprocessable_entity_exception(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
      end
    end