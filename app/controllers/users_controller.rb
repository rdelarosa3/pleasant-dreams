class UsersController < Clearance::UsersController
  before_action :set_user, only: [:show, :edit, :update, :destroy,]
  before_action :set_business, only: [:index, :create,:show, :edit, :update, :destroy, :registration, :create, :new_staff]
  before_action :validate_user, only: [:edit, :update, :destroy]
  before_action :is_admin, only: [:new, :registration, :create, :new_staff, :index]
  # before_action :redirect_signed_in_users, except:[:new, :create, :registration]
  
    def create
      @user = User.new(user_params)
      if @user.save

        redirect_to edit_user_path(@user.id)
      else
        redirect_to sign_up_path
      end
    end
    
    def registration
      @user = User.new
    end

    def new_staff
      @user = User.new(user_params)
      if @user.save
        redirect_to edit_user_path(@user.id)
      else
        redirect_to sign_up_path
      end
    end

    def index
      @users = User.all
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
      if @user.admin? 
        unless signed_in? && current_user.admin?
          redirect_to root_path
        end
      end
    end
    
    private
    # Use to validate only authorized user is viewing page
    def is_admin
      unless signed_in? && (current_user == User.first || current_user.admin? || current_user.operator?)
        redirect_to root_path
      end
    end

    def validate_user
      unless signed_in? && (current_user.admin? || current_user.id == @user.id || current_user.operator?)
        redirect_to root_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_business
      @business = Business.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :hashtag, :birthday, :password, :password_confirmation, :bio, :avatar, :phone_number, :title, :remove_avatar, :facebook, :instagram, :linkedin, :title_id)
    end
  end