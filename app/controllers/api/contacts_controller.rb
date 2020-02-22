class Api::ContactsController < ApplicationController
  def first_contact_action
    @contact = Contact.find(1)
    render 'first_contact_view.json.jbuilder'
  end

  def all_contacts_action
    @contacts = Contact.all
    render 'all_contacts_view.json.jbuilder'
  end
end
