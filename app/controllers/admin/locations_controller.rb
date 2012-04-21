module Admin
  class LocationsController < ApplicationController
    before_filter :require_admin

    expose(:location)

    def new
    end

    def create
      if location.save
        redirect_to([:admin, location], notice: "Location successfully created.")
      else
        render :new
      end
    end

    def link
      direction = params[:direction]
      other_location = Location.find(params[:other_location_id])
      location.send("#{direction}=", other_location)
      location.save
      redirect_to(admin_location_path(location))
    end

    private

    def require_admin
      redirect_to(root_path, alert: "You are not authorized!") unless admin?
    end

    def admin?
      current_user && current_user.admin
    end
  end
end
