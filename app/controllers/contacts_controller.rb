class ContactsController < ApplicationController
  def index
    @user = current_user
    @user.groups.each do |group|
      @hash = Gmaps4rails.build_markers(group.contacts) do |contact, marker|
        marker.lat contact.latitude
        marker.lng contact.longitude
      end
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @hash = Gmaps4rails.build_markers(@contact) do |contact, marker|
      marker.lat contact.latitude
      marker.lng contact.longitude
    end
    @comment = Comment.new
    @checkins = Checkin.where(contact_id: params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @group = @contact.group
    if @contact.save
      flash[:success] = 'Contact Created'
      redirect_to group_path(@contact.group)
    else
      flash[:alert] = @contact.errors.full_messages.join(', ')
      redirect_to new_group_contact_path(@contact.group)
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = "#{@contact.title} has been updated."
      redirect_to @contact
    else
      flash[:errors] = @contact.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      flash[:success] = "Contact has been deleted from #{@contact.group.name}."
      redirect_to group_path(@contact.group)
    else
      flash[:alert] = @contact.errors.full_messages.join(', ')
      redirect_to group_path(@contact.group)
    end
  end

  protected

  def contact_params
    params.require(:contact).permit(
      :company_name,
      :first_name,
      :last_name,
      :email,
      :address,
      :city,
      :state,
      :zip,
      :phone,
      :phone_ext,
      :category,
      :description,
      :group_id
    )
  end
end
