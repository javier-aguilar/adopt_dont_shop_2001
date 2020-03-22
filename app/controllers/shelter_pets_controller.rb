class ShelterPetsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    shelter.pets.create(shelter_pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def show
    if(params["adoptable"] == "true")
      @pets = Pet.where(:shelter_id => params[:id], :status => "Adoptable")
    elsif(params["adoptable"] == "false")
      @pets = Pet.where(:shelter_id => params[:id], :status => "Pending")
    else
      @pets = Pet.where(:shelter_id => params[:id])
    end
    @pet_num = @pets.size
    @shelter = Shelter.find(params[:id])
  end

  private

  def shelter_pet_params
    params[:status] = "Adoptable"
    params.permit(:image,
                  :name,
                  :description,
                  :approx_age,
                  :sex,
                  :status)
  end

end