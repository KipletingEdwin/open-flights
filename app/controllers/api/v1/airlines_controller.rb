

module Api 
    module V1
        class AirlinesController < ApplicationController 

            def index
                airlines = Airline.all 
                render json: AirlineSerializer.new(airlines).serialized_json
            end

            def show
                airline = Airline.find_by(slug: params[:slug])
                render json: AirlineSerializer.new(airline).serialized_json
            end

            def create 
                airline = Airline.new(airline_params) 

                if airline.save 
                    render json: AirlineSerializer.new(airline).serialized_json, status: 422 
                else 
                    render json: { errors: airline.errors.full_messages }, status: 422 
                end
            end

            def update 
                airline = Airline.find_by(slug: params[:slug]) 

                if airline.update(airline_params ) 
                    render json: AirlineSerializer.new(airline).serialized_json 
                    else 
                        render json: { errors: airline.errors.full_messages }, status: 422 
                    end

            end

            def destroy 
                airline = Airline.find_by(slug: params[:slug]) 
                if  airline.destroy 
                head :no_content 
                else 
                    render json: {error: airline.errors.messages}, status: 422 
                end
            end


            private

            def airline_params
                params.require(:airline).permit(:name, :image_url)
            end
            
        end
    end
end