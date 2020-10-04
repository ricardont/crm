class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_customers, only: [ :edit, :update ]
  before_action :authenticate_user!
  def index
    @appointments = current_user.appointments.all
  end
  def calendar
  end
  def show
  end
  def new
    @appointment = current_user.appointments.new(appointment_params)
  end
  def edit
  end
  def create
    @appointment = current_user.appointments.new(appointment_params)
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Cita creada.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: ' Cita actualizada.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Cita eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end
  private
    def set_appointment
      @appointment = current_user.appointments.find(params[:id])
      @customer    = current_user.customers.last
    end
    def set_customers
      @customers = current_user.customers.order(:name)
    end
    def appointment_params
      params.require(:appointment).permit(:date_time, :duration, :user_id, :customer_id, :location_id, :product_id, :status)
    end
end