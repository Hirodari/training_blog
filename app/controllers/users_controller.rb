class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    # byebug
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "#{@user.username} was successfully created."
        redirect_to @user
      else
        #flash[:danger] = 'Something went wrong'
        render 'new'
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #respond_to do |format|
      if @user.update(user_params)
        flash[:info]= "#{@user.username} was successfully updated."
        redirect_to @user
        #format.json { render :show, status: :ok, location: @user }
      else
        render 'edit'
        #format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    #respond_to do |format|
    flash[:danger] = "#{@user.username} was successfully destroyed."
      #format.html { redirect_to users_url, danger: 'User was successfully destroyed.' }
      #format.json { head :no_content }
    redirect_to users_path

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password,  :created_at, :updated_at)
    end
end
