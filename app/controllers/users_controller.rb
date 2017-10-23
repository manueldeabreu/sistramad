class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource :only => [:new, :edit, :destroy]

  add_breadcrumb "home", :authenticated_root_path, :title => "Back to the home"

  # GET /users
  # GET /users.json
  def index
    add_breadcrumb "users", users_path

    @users = User.all.page(params[:page]).per(10)
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
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # format.html { redirect_to @user, notice: 'User was successfully created.' }

        flash[:success] = 'User was successfully created.'
        format.html {
          if user_params[:avatar].present?
            render :crop  ## Render the view for cropping
          else
            redirect_to @user
          end
        }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {
          if user_params[:avatar].present?
            render :crop  ## Render the view for cropping
          else
            redirect_to @user, notice: 'User was successfully updated.'
          end
        }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'El usuario fue eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(
        :username,
        :email,
        :password,
        :password_confirmation,
        :first_name,
        :middle_name,
        :last_name,
        :genre,
        :identification_document,
        :birthday,
        :avatar,
        :avatar_crop_x,
        :avatar_crop_y,
        :avatar_crop_w,
        :avatar_crop_h)
  end
end
