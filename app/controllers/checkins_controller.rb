class CheckinsController < ApplicationController
  def new
    @checkin = Checkin.new
    @contact_options = Contact.all.map{ |u| [ u.company_name, u.id ] }
    @contacts = []
    current_user.groups.each do |group|
      group.contacts.each do |contact|
        @contacts << contact
      end
    end
    @hash = Gmaps4rails.build_markers(@contacts) do |contact, marker|
      marker.lat contact.latitude
      marker.lng contact.longitude
    end
  end

  def create
    @checkin = Checkin.new(checkin_params)
    if !@checkin.contact_id.nil?
      @checkin.latitude = @checkin.contact.latitude
      @checkin.longitude = @checkin.contact.longitude
    end
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
    params.require(:checkin).permit(:latitude, :longitude, :user_id, :contact_id, :message)
  end
end
