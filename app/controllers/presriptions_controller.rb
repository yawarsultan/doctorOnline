class PresriptionsController < ApplicationController
  before_action :set_presription, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_super_admin_or_user, only: [:edit, :update, :destroy ]

  # GET /presriptions
  # GET /presriptions.json
  def index
    @presriptions = Presription.all
  end

  # GET /presriptions/1
  # GET /presriptions/1.json
  def show
    @presription = Presription.find(params[:id])
   respond_to do |format|
      format.html
      format.pdf { render :layout => false }
    end
  end

  # GET /presriptions/new
  def new
    @presription = Presription.new
  end

  # GET /presriptions/1/edit
  def edit
  end

  # POST /presriptions
  # POST /presriptions.json
  def create
    # @user = current_user
    
    @presription = current_user.presriptions.build(presription_params)

    respond_to do |format|
      if @presription.save
        format.html { redirect_to stream_path, notice: 'Presription was successfully created.' }
        format.json { render :show, status: :created, location: @presription }
      else
        format.html { render :new }
        format.json { render json: @presription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presriptions/1
  # PATCH/PUT /presriptions/1.json
  def update
    respond_to do |format|
      if @presription.update(presription_params)
        format.html { redirect_to @presription, notice: 'Presription was successfully updated.' }
        format.json { render :show, status: :ok, location: @presription }
      else
        format.html { render :edit }
        format.json { render json: @presription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presriptions/1
  # DELETE /presriptions/1.json
  def destroy
    @presription.destroy
    respond_to do |format|
      format.html { redirect_to prescription_path, notice: 'Presription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presription
      @presription = Presription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presription_params
      params.require(:presription).permit(:disease, :drug_name, :quantity, :name, :age,:user_id, :user_email)
    end

    def check_super_admin_or_user
    unless current_user.id == @presription.user_id || current_user.doctor? || current_user.super_admin?
      redirect_to_root_with_error
    end
  end
end
