require './lib/address_book'

@current_contact

def main_menu
  puts "Press 'a' to add a new contact."
  puts "Press 'l' to show contacts."
  puts "Press 'd' to delete a contact."
  puts "Press 'e' to edit a contact."
  puts "Press 'x' to exit the program."

  main_choice = gets.chomp

  case main_choice
    when "a"
      puts "Enter the name of the contact:"
      contact_name = gets.chomp
      Contact.new(contact_name)
      puts "The contact '#{contact_name}' has been added.\n"
      main_menu
    when "l"
      list_contacts
      main_menu
    when "d"
      list_contacts

      puts "Type the name of the contact to delete it:"
      contact_name = gets.chomp
      @current_contact = Contact.contact_search(contact_name)
      @current_contact.contact_delete
      puts "The contact '#{contact_name}' has been deleted."
      puts "\n"
      main_menu
    when "e"
      list_contacts
      puts "Type the name of the contact to edit it:"
      contact_name = gets.chomp
      @current_contact = Contact.contact_search(contact_name)
      edit_menu
    when "x"
      puts "So long."
      exit
    else
      puts "That's not an option!"
      main_menu
  end
end

def list_contacts
  puts "List of Contacts\n"
  puts Contact.list_contacts
  puts "\n"
end

def edit_menu
  puts "Press 'n' to edit name of contact"
  puts "Press 'p' to edit phone of contact"
  puts "Press 'e' to edit email of contact"
  puts "Press 'a' to edit a adress."
  puts "Press 'x' to exit the program."
  puts "Press 'm' to go to main menu."
  edit_choice = gets.chomp

  case edit_choice
    when 'n'
      puts "The current contact name is #{@current_contact.name}"
      puts "Please enter new name"
      new_name = gets.chomp
      @current_contact.edit_name(new_name)
      puts "Name changed to #{@current_contact.name}"
      edit_choice
    when 'p'
      phone_menu
    when 'e'
      email_menu
    when 'a'
      address_menu
    when 'm'
      main_menu
    when 'x'
      puts "So long."
      exit
    else
      puts "That's not an option!"
      edit_menu
    end

end

def phone_menu
  puts "#{The current contact name is @current_contact.name}"
  puts "Press 'a' to add phone number"
  puts "Press 'l' to list phone numbers"
  puts "Press 'e' to return to edit menu"
end
main_menu
