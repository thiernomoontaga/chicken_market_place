class FarmersController < ApplicationController

  #before_action :authenticate_user!

  before_action :set_farmer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ index edit update create destroy ]

  # Its route is /farmers
  def index

    @farmers = Farmer.all

    # Specify the farmers for current_user only
    @farmers = current_user.farmer

  end

  # Its route is farmers/id ; eg: farmers/2
  def show
  end

  # Get it by farmers/new
  def new

    @farmer = Farmer.new

  end

  def edit
  end


  def create

    # Create a farmer with foreign_key (user_id) added by back_end code
    @farmer = Farmer.new(farmer_params)
    @farmer.user = current_user

    respond_to do |format|
      if @farmer.save
        format.html { redirect_to farmer_url(@farmer), notice: "Farmer was successfully created." }
        format.json { render :show, status: :created, location: @farmer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end

  end

  def update

    respond_to do |format|
      if @farmer.update(farmer_params)
        format.html { redirect_to farmer_url(@farmer), notice: "Farmer was successfully updated." }
        format.json { render :show, status: :ok, location: @farmer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy

    @farmer.destroy!

    respond_to do |format|
      format.html { redirect_to farmers_url, notice: "Farmer was successfully destroyed." }
      format.json { head :no_content }
    end

  end

  private

  def set_farmer
    @farmer = Farmer.find(params[:id])
  end

  def farmer_params

    #Params customized
    #params.require(:farmer).permit(:name, :address, :description, :user_id)
    params.require(:farmer).permit(:name, :address, :description)

  end

end
