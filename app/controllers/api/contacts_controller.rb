class Api::ContactsController < ApplicationController
  before_action :authenticate_user

  def index

    name_search = params[:search]
    group_name = params[:group_name]

    @contacts = current_user.contacts

    if group_name
      group = Group.find_by(name: group_name)
      @contacts = group.contacts   
    end

    @contacts = @contacts.where(
                                'first_name iLIKE ?
                                OR middle_name iLIKE ? 
                                OR last_name iLIKE ?', 
                                "%#{name_search}%",
                                "%#{name_search}%", 
                                "%#{name_search}%"
                                ) if name_search

    render 'index.json.jbuilder'

  end

  def create  
    @contact = Contact.new(
                          first_name: params[:first_name],
                          middle_name: params[:middle_name],
                          last_name: params[:last_name],
                          email: params[:email],
                          phone_number: params[:phone_number],
                          bio: params[:bio],
                          user_id: current_user.id
                          )
    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: {message: 'The contact was destroyed.'}
  end
end
