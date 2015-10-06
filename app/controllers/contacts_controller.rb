class ContactsController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @contact = Contact.find(params[:id])
  end
end
