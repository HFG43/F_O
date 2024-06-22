class FamiliesController < ApplicationController
  before_action :set_family, only: %i[ show edit update destroy ]  
    # GET /family/new
  def new
    @family = Family.new
  end

  def show
  end
    
  # GET /family/1/edit
  def edit
  end

  # POST /families or /families.json
  def create
    @family = Family.new(family_params)
   
    respond_to do |format|
      if @family.save
        format.html { redirect_to family_url(@family), notice: "Family was successfully created." }
        format.json { render :show, status: :created, location: @family }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family/1 or /family/1.json
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to family_url(@family), notice: "Family was successfully updated." }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family/1 or /family/1.json
  def destroy
    @family.destroy!

    respond_to do |format|
      format.html { redirect_to families_url, notice: "Family was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def family_params
      params.require(:family).permit(:family_name, :family_registration_email, :family_image)
    end
end
