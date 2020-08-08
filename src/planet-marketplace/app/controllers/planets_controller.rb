class PlanetsController < ApplicationController

  before_action only: [:new, :edit, :create]

  def view
    
  end

  def edit
  end

  def new
    @planet = planet.new
  end

  def create  
    @planet = planet.new(planet_params)

    respond_to do |format|
      if @planet.save
        format.html { redirect_to view_planet_path(@planet.id), notice: "A planet's record has been successfully created." }
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
      format.html { redirect_to root_path, notice: "A planet's record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def planet_params
    params.require(:planet).permit(:name, :description, :picture)
  end
  
end
