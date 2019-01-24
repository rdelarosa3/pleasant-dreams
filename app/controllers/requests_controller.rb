class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_business, only: [:create, :show, :edit, :update, :destroy, :index, :new]
  # include UsersHelper

  def index
        @requests = Request.all.order(created_at: :desc ).order(updated_at: :desc )
  end
  
  def show
  end

  def new
    @request = Request.new
    @business = Business.first
  end

  def edit
  end


  def create

    @request = Request.new(request_params)
    @users = User.all.where(role: [1,2])
    respond_to do |format|
      if @request.save # format.js { render :file => "/layouts/application.js"}
        RequestMailer.status_email(@request).deliver
        RequestMailer.new_request(@request,@users).deliver
        flash.now.notice = "Inquiry request submitted."
        format.html { redirect_to root_path, notice: 'Inquiry request submitted.' }
        format.json { render :show, status: :created, location: @request }

      else
        flash.now.notice = @request.errors.full_messages.to_sentence 

        format.html { render :new, anchor: 'div2' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
   
  end


  def update
    unless current_user.operator? || current_user.admin?
      redirect_to new_request_path, notice: 'Request for current service already exists.'
    end
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to requests_url, notice: 'Request was successfully updated.' }
        # format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
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
    def set_request
      @request = Request.find(params[:id])
    end
    def set_business
      @business = Business.first
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:subject, :email, :first_name, :last_name, :phone_number, :message, :reviewed)
    end
end
