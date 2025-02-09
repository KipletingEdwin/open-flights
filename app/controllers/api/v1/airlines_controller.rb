

module Api 
    module V1
        class AirlinesController < ApplicationController 

            def index
                airlines = Airline.all 
                render json: AirlineSerializer.new(airlines).serialized_json
            end

            def show
            end

            def create
            end

            def update
            end

            def destroy
            
        end
    end
end