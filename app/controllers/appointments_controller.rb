class AppointmentsController < ApplicationController
	 before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_appointments, only: [:index, :show, :edit]
  # before_action :set_client, only: [:index, :new, :edit]
  # before_action :set_location, only: [:index, :new, :edit]
    
  def index 
    @upcoming_appointments = current_user.upcoming_appointments
  end 
  
  def show 
  end
  
  def new 
    @appointments = current_user.appointments.select { |a| a.persisted? }
    @appointment = current_user.appointments.build
  end
  
  def create 
    @appointment = Appointment.new(appointment_params.merge(user_id: current_user.id))
    if @appointment.valid?
      @appointment.save
      flash[:success] = "Appointment created successfully you will be contacted by the doctor at the specified time"
      redirect_to appointments_path
    else 
      @appointment.user = nil
      @appointments = current_user.appointments.select { |a| a.persisted? }
      flash[:error] =  "There are some errors in the form please fill again."
      render :new
    end
  end
  
  def edit 
  end
  
  def update 
    if @appointment.update(appointment_params)
      redirect_to appointments_path
    else 
      set_appointments
      render :edit
    end
  end
  
  def destroy 
    @appointment.destroy 
    redirect_to appointments_path
  end
  
  private 
  
  # def set_client 
  #   @client = current_user.clients.find_by(id: params[:client_id])
  # end
  
  # def set_location
  #   @location = current_user.locations.find_by(id: params[:location_id])
  # end
  
  def set_appointment
    @appointment = current_user.appointments.find_by(id: params[:id])
    if @appointment.nil? 
      flash[:error] = "Appointment not found."
      redirect_to appointments_path
    end
  end
  
  def set_appointments
    @appointments = current_user.appointments.order(appointment_time: :desc)
  end
  
  def appointment_params
    params.require(:appointment).permit( :patient_name,:doctor_name, :room,:special,appointment_time: [:date, :hour, :min], duration: [:hour, :min])
  end
  
end
