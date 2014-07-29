class Contact
  attr_accessor(:name, :phone_numbers, :emails, :addresses)
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@all_contacts = []
  end

  def Contact.list_contacts
    current_list = ""
    @@all_contacts.each do |contact|
      current_list+= "#{contact.name}\n"
    end
    current_list
  end

  def Contact.contact_search(contact_name)
    current_contact = Object.new
    @@all_contacts.each do |contact|
      if contact.name == contact_name
        current_contact = contact
      end
    end
    current_contact
  end

  def initialize(name)
    @name = name
    @phone_numbers = []
    @emails = []
    @addresses = []
    save
  end

  def save
    @@all_contacts << self
  end

  def save_phone(phone_number_obj)
    @phone_numbers << phone_number_obj
  end

  def list_phone_numbers
    current_list = ""
    @phone_numbers.each do |number|
      current_list+= "#{number.phone_number}\n"
    end
    current_list
  end

  def save_email(email_obj)
    @emails << email_obj
  end

  def list_email_addresses
    current_list = ""
    @emails.each do |mail|
      current_list+= "#{mail.email}\n"
    end
    current_list
  end

  def save_address(address_obj)
    @addresses << address_obj
  end

  def list_addresses
    current_list = ""
    @addresses.each do |address|
      current_list+= "#{address.address}\n"
    end
    current_list
  end

  def edit_name(new_name)
    @name = new_name
  end

  def contact_delete
    @@all_contacts.delete(self)
  end

end

class Phone
  attr_accessor(:phone_number)
  def initialize(number)
    @phone_number = number
  end
end

class Email
  attr_accessor(:email)
  def initialize(email)
    @email = email
  end
end

class Address
  attr_accessor(:street, :city, :state, :zip, :address)
  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
    @address = "#{street} #{city} #{state} #{zip}"
  end
end

