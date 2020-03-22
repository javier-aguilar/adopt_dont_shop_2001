class SheltersController < ApplicationController
  def index
    if(params["sort"] == "adoptable")
      @shelters = Shelter.joins(:pets).where("pets.status" == "Adoptable").group("shelters.id").order("count(pets.status) DESC")
      # Shelter.left_joins(:pets).group(:id).order Pet.where(:status => "Adoptable").count
    elsif(params["sort"] == "alphabetical")
      @shelters = Shelter.all.order("name ASC")
    else
      @shelters = Shelter.all
    end
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

end