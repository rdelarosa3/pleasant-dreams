class UsersController < Clearance::UsersController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:edit, :update, :destroy]
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to sign_in_path
      else
        redirect_to sign_up_path
      end
    end
    
    def update

      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'Account was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end

    end

    def show

    end
    
    private
    # Use to validate only authorized user is viewing page
    def validate_user
      unless signed_in? && (current_user.admin? || current_user.id == @user.id)
        redirect_to root_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :birthday, :password, :password_confirmation, :bio, :avatar, :phone_number, :title, :remove_avatar, :facebook, :instagram, :linkedin, :title_id)
    end
  end