class ClientsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :raise_record_not_found
    
      def index
        render json: Client.all
      end
    
      def show
        render json: find_client
      end
    
      def update
        updated = find_client.update(client_params)
        if updated
          render json: find_client, status: :ok
        else
          render json: { error: "Could not update record" }, status: :forbidden
        end
      end
    
      private
    
      def find_client
        Client.find(params[:id])
      end
    
      def client_params
        params.require(:client).permit(:name, :age)
      end
    
      def raise_record_not_found
        render json: { error: "Client data not found" }, status: :not_found
      end
    end