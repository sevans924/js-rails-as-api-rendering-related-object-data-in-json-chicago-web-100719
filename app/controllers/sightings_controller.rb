class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings.to_json(include: [:bird, :location])
      end


    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
        render json: sighting, include: [:bird, :location]
        # alternative to above: render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
        else
        render json: { message: 'No sighting found with that id' }
        end    
    end
end
