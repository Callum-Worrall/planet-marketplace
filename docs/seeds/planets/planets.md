Planet Classes

enum sizes {
  dwarf
  planetoid
  planet
  star
}

enum types {
  terrestrial
  gaseous
  liquid
}

enum climate {
  temperate
  frozen
  desert
  molten
}


  def rng_create
    @planet = Planet.new

    @planet.update_attribute(:user_id, current_user.id)
    @planet.update_attribute(:name, Faker::Movies::HitchhikersGuideToTheGalaxy.planet)
    @planet.update_attribute(:description, "There might be something peculiar about this planet, there might not be.")

    # @planet.update_attribute(:name, Faker::Movies::StarWars.planet)
    # @planet.update_attribute(:name, Faker::TvShows::Stargate.planet)

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
