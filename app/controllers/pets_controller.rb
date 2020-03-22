class PetsController < ApplicationController

  def index
    if(params["adoptable"] == "true")
      @pets = Pet.where(:status => "Adoptable")
    elsif(params["adoptable"] == "false")
      @pets = Pet.where(:status => "Pending")
    else
      @pets = Pet.all
    end

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

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      image: params[:image],
      name: params[:name],
      age: params[:age],
      description: params[:description],
      sex: params[:sex],
    })
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  private

  def pet_params
    params.permit(:image, :name, :age, :description, :sex)
  end

end