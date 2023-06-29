class ReadmesController < ApplicationController
  respond_to :json
  before_action :set_user
  before_action :set_readme, only: [:show, :update, :destroy]

  # GET /users/:user_id/readmes
  def index
    readmes = @user.readmes
    render json: readmes
  end

  # GET /users/:user_id/readmes/1
  def show
    render json: @readme
  end

  # POST /users/:user_id/readmes
  def create
    readme = @user.readmes.new(readme_params)
    if readme.save
      render json: readme, status: :created
    else
      render json: { errors: readme.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:user_id/readmes/1
  def update
    if @readme.update(readme_params)
      render json: @readme
    else
      render json: { errors: @readme.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id/readmes/1
  def destroy
    @readme.destroy
    render json: { message: 'Readme deleted successfully' }
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_readme
    @readme = @user.readmes.find(params[:id])
  end

  def readme_params
    params.require(:readme).permit(:name, :age, :gender, :gender_pref, :location, :programming_language, :image)
  end
end
