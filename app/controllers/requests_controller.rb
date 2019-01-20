class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:show, :edit, :update, :destroy, :index]
  # include UsersHelper

  def index
    # checks if user admin or logged in
    # if params[:request]
      
    #   @requests = request.includes(:user).where(nil).all
    #   # if params[:request][:date_start] != "" || params[:request][:date_end] != ""
    #   #   @requests = @requests.date_range(params[:request][:date_start],params[:request][:date_end]).all 
    #   # end
    #   if params[:request][:date_on] != "" 
    #     @requests = @requests.on_date(params[:request][:date_on]).all 
    #   end
    #   if params[:request][:stylist] != ""
    #     @requests = @requests.stylist_name(params[:request][:stylist]).all 
    #   end
    #   if params[:request][:service] != ""
    #     @requests = @requests.service_name(params[:request][:service]).all 
    #   end
    #   @requests.order('status = 0 DESC').order(request_date: :desc ).order(request_time: :desc )
    #   respond_to do |format|    
    #     format.html {render :index }
    #     format.js
    #   end
    # else
    #   if request.all.where(status: 'pending').any?
    #     @requests = request.all.where(status: 'pending')
    #   else  
    #   @requests = request.all.order(status: :desc).order(request_date: :desc ).order(request_time: :desc )
    #   end
    # end
  end

  def contact
    @request = Request.new
  end

  def new
    @request = Request.new
  end

  def edit
  end


  def create

    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save # format.js { render :file => "/layouts/application.js"}
        flash.now.notice = "Inquiry request submitted."
        format.html { redirect_to current_user, notice: 'Inquiry request submitted.' }
        format.json { render :show, status: :created, location: @request }

      else
        # flash.now.notice = @request.errors.full_messages.to_sentence 
        flash.now.notice = @request.errors[:overlapping_appointments].first || @request.errors[:stylist_id].first || @request.errors[:verify_time].first || @request.errors[:verify_day].first
        format.js { render :file => "/layouts/application.js"}
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
   
  end


  def update
    unless current_user.operator? || current_user.admin?
      redirect_to new_request_path, notice: 'request for current service already exists.'
    end
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to requests_url, notice: 'request was successfully updated.' }
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
      format.html { redirect_to requests_url, notice: 'request was successfully destroyed.' }
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
      @request = request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:subject, :email, :first_name, :last_name, :phone_number, :message)
    end
end
