class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  skip_before_action :verify_authenticity_token, raise: false

def create
  begin
    user = User.new(user_params)

    if user.save
      sign_in(user)

      readme = Readme.create!(readme_params.merge(user_id: user.id))

      render json: { user: user, readme: readme }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end
end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def readme_params
  params.require(:readme).permit(:name, :age, :gender, :gender_pref, :location, :programming_language, :image, :user_id)
  end
end
