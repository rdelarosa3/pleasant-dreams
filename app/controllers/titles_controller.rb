class TitlesController < ApplicationController
  before_action :set_title, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:show, :edit, :update, :destroy, :new, :index]
  before_action :set_business, only: [:show, :edit, :update, :destroy, :index, :new]
  
  def new
    @title = Title.new
    @business = Business.first
  end


  def index
    @titles = Title.all
    @business = Business.first
  end 

  def create
    @title = Title.new(title_params)

    respond_to do |format|
      if @title.save
        format.html { redirect_to @title, notice: 'Business hour was successfully created.' }
        format.json { render :show, status: :created, location: @title }
      else
        format.html { render :new }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @title.update(title_params)
        format.html { redirect_to @title, notice: 'Business hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @title }
      else
        format.html { render :edit }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @title.destroy
    respond_to do |format|
      format.html { redirect_to titles_url, notice: 'Business hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # to keep users other than admin from accessing
    def authorize
      if signed_in?
        unless current_user.admin? || current_user.operator?
          redirect_to root_path, alert: 'You must be admin to access this page.' 
        end
      else
        redirect_to root_path
      end
    end 
    # Use callbacks to share common setup or constraints between actions.
    def set_title
      @title = Title.find(params[:id])
    end

        def set_business
      @business = Business.first
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def title_params
      params.require(:title).permit(:business_id, :day, :open_time, :close_time, :closed)
    end
end
