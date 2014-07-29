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
      puts "Type the new name of the contact:"
      new_contact_name = gets.chomp
      @current_contact.edit_name(new_contact_name)
      puts "The contact has been changed from '#{contact_name}' to '#{new_contact_name}.'"
      puts "\n"
      main_menu
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

main_menu
