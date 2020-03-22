class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def create
    shelter = Shelter.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
    })
    shelter.save
    redirect_to '/shelters'
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
    })
    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  def show_pets
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

end