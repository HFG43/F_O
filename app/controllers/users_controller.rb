class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params.except(:family_name, :family_token))

    puts "Family Name: #{user_params[:family_name]}"
    puts "Family Token:#{user_params[:family_token]}"
    puts "User Parameters: #{user_params.inspect}"
  
    if !validate_family(user_params[:family_name], user_params[:family_token], @user)
      flash[:notice] = "Invalid family credentials."
      render :new, status: :unprocessable_entity
    else
      respond_to do |format|
        if @user.save
          format.html { redirect_to user_url(@user), notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end  
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params.except(:family_name, :family_token))
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def validate_family(family_name, family_token, user)
      family = Family.find_by(family_name: family_name)
         
      if family && family_token == family.token
        user.family_id = family.id
        true
      else
        false
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :birthday, :profile_image, :family_name, :family_token, :family_id)
    end
end
