class CheckinsController < ApplicationController
  def new
    @checkin = Checkin.new
    @contact_options = Contact.all.map{|u| [ u.company_name, u.id ] }
    @contacts = Contact.all
    @hash = Gmaps4rails.build_markers(@contacts) do |contact, marker|
      marker.lat contact.latitude
      marker.lng contact.longitude
    end
  end

  def create
    @checkin = Checkin.new(checkin_params)
    if @checkin.save
      flash[:success] = 'Check-in Logged'
      redirect_to user_path(current_user)
    else
      flash[:alert] = @checkin.errors.full_messages.join(', ')
      redirect_to new_checkin_path
    end
  end

  protected

  def checkin_params
    params.require(:checkin).permit(:latitude, :longitude, :user_id, :message)
  end
end
