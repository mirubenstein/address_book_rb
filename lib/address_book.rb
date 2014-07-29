class Contact
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@all_contacts = []
  end

  def initialize(name)
    @name = name
    @phone_number = []
    @email = []
    @address = []
    save
  end

  def save
    @@all_contacts << self
  end

  def save_phone(phone_number_obj)
    @phone_number << phone_number_obj
  end

  def name
    @name
  end

  def phone_number
    @phone_number
  end

  def edit_name(new_name)
    @name = new_name
  end

  def delete_contact(name)
    @@all_contacts.delete_if {|contact| contact.name == name}
  end

end

class Phone
  def initialize(number)
    @phone_number = number
  end

  def phone_number
    @phone_number
  end
end

class Email
  def initialize(email)
    @email = email
  end

  def email
    @email
  end
end

class Address
  def initialize(street, city, state, zip)
    @address = "#{street} #{city} #{state} #{zip}"
  end

  def address
    @address
  end
end

