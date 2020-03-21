class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter_id = params[:id]
    pet = Pet.new({
      image: params[:image],
      name: params[:name],
      age: params[:age],
      description: params[:description],
      sex: params[:sex],
      status: "Adoptable",
      shelter_id: shelter_id,
    })
    pet.save
    redirect_to "/shelters/#{shelter_id}/pets"
  end

  private

  def pet_params
    params.permit(:image, :name, :age, :description, :sex)
  end

end