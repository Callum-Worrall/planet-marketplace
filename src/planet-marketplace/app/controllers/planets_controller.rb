class PlanetsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_planet, only: [:edit, :update, :destroy]
  before_action :get_profile

  def edit

  end

  def new
    @planet = Planet.new
  end

  def create  
    @planet = Planet.new(planet_params)

    @planet.update_attribute(:user_id, current_user.id)

    respond_to do |format|
      if @planet.save
        format.html { redirect_to view_profile_path(@profile.id), notice: 'Planet was successfully created.' }
        format.json { render :view, status: :created, location: @planet }
      else
        format.html { render :new }
        format.json { render json: @planet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @planet.update(planet_params)
        format.html { redirect_to update_patch_planet_path(@planet.id), notice: "A planet's record has been successfully updated." }
        format.json { render :show, status: :ok, location: @planet }
      else
        format.html { render :edit }
        format.json { render json: @planet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @planet.destroy
    respond_to do |format|
      format.html { redirect_to view_profile_path(@profile.id), notice: "A planet's record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def planet_params
    params.require(:planet).permit(:name, :description, :picture)
  end

  def get_planet
    @planet = Planet.find(params[:id])
  end

  def get_profile
    @profile = Profile.find_by user_id: current_user.id
  end
end
