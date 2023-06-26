class ReadmesController < ApplicationController
  def index
    readmes = Readme.all
    render json: readmes
  end
  
  def create
    readme = Readme.create(readme_params)
    if readme.valid?
      render json: readme
    else
      render json: readme.errors, status: 422
    end
  end
  
  def update
    readme = Readme.find(params[:id])
    readme.update(readme_params)
    if readme.update(readme_params)
      render json: readme
    else
      render json: readme.errors, status: 422
    end
  end
  
 
  def destroy
    readme = Readme.find(params[:id])
    readmes = Readme.all
    if readme.destroy
      render json: readme, status: 410
    else
      render json: readme.errors
    end
  end

  private
  def readme_params
    params.require(:readme).permit(:name, :age, :gender, :gender_preference, :location, :programming_language, :image, :user_id)
  end
end
