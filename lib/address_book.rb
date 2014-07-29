class Contact
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@all_contacts = []
  end

  def initialize(name)
    @names = name
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

  # def list_addresses
  #   current_list = ""
  # end

  def name
    @names
  end

  def phone_number
    @phone_numbers
  end

  def email
    @emails
  end

  def address
    @addresses
  end

  def edit_name(new_name)
    @names = new_name
  end

  def delete_contact(name)
    @@all_contacts.delete_if {|contact| contact.name == name}
  end

end

class Phone
  def initialize(number)
    @phone_numbers = number
  end

  def phone_number
    @phone_numbers
  end
end

class Email
  def initialize(email)
    @emails = email
  end

  def email
    @emails
  end
end

class Address
  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
    @addresses = "#{street} #{city} #{state} #{zip}"
  end

  def street
    @street
  end

  def city
    @city
  end

  def state
    @state
  end

  def zip
    @zip
  end

  def address
    @addresses
  end
end

