require 'rspec'
require 'address_book'

describe Contact do
  before do
    Contact.clear
  end

  it "is initialized with a name, phone number, email, and mailing address and saves it to Contact Class" do
    john_doe = Contact.new("John Doe")
    expect(john_doe.name).to eq "John Doe"
    expect(Contact.all).to eq [john_doe]
  end

  it "it has class variable all that returns all intances of Contact" do
    Contact.clear
    expect(Contact.all).to eq []
  end

  it "clears out all of the contacts" do
    Contact.new("John Doe")
    Contact.clear
    expect(Contact.all).to eq []
  end

  it 'edits contact name' do
    john_doe = Contact.new("John Doe")
    john_doe.edit_name("Jane Doe")
    expect(john_doe.name).to eq "Jane Doe"
  end

  it "deletes the contact" do
    Contact.clear
    john_doe = Contact.new("John Doe")
    john_doe.delete_contact("John Doe")
    expect(Contact.all).to eq []
  end

  it "save phone numbers to contact" do
    john_doe = Contact.new("John Doe")
    john_doe_phone = Phone.new(5031234)
    john_doe.save_phone(john_doe_phone)
    expect(john_doe.phone_number).to eq [john_doe_phone]
  end

  it "returns array of phone numbers as formatted text" do
    john_doe = Contact.new("John Doe")
    john_doe_phone = Phone.new(5552424)
    john_doe.save_phone(john_doe_phone)
    expect(john_doe.list_phone_numbers).to eq "5552424\n"
  end

end

describe Phone do

  it 'is initialized with phone number' do
    john_doe_phone = Phone.new(5552424)
    expect(john_doe_phone.phone_number).to eq 5552424
  end

end

describe Email do

  it "is initialized with an email address" do
    john_doe_email = Email.new("john_doe@gmail.com")
    expect(john_doe_email.email).to eq "john_doe@gmail.com"
  end

end

describe Address do

  it "is initialized with an address" do
    john_doe_address = Address.new("1234 Easy Street", "Portland", "OR", 97201)
    expect(john_doe_address.address).to eq "1234 Easy Street Portland OR 97201"
  end

end


