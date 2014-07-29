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

  it "outputs formmated array" do
    Contact.clear
    Contact.new("John Doe")
    expect(Contact.list_contacts).to eq "John Doe\n"
  end

  it 'returns instance contact based on name' do
    Contact.clear
    john_doe = Contact.new("John Doe")
    jane_doe = Contact.new("Jane Doe")
    expect(Contact.contact_search("Jane Doe")).to eq(jane_doe)
  end

  it 'edits contact name' do
    john_doe = Contact.new("John Doe")
    john_doe.edit_name("Jane Doe")
    expect(john_doe.name).to eq "Jane Doe"
  end

  it "deletes the contact" do
    Contact.clear
    john_doe = Contact.new("John Doe")
    john_doe.contact_delete
    expect(Contact.all).to eq []
  end

  it "save phone numbers to contact" do
    john_doe = Contact.new("John Doe")
    john_doe_phone = Phone.new(5031234)
    john_doe.save_phone(john_doe_phone)
    expect(john_doe.phone_numbers).to eq [john_doe_phone]
  end

  it "returns array of phone numbers as formatted text" do
    john_doe = Contact.new("John Doe")
    john_doe_phone = Phone.new(5552424)
    jane_doe_phone = Phone.new(3602424)
    john_doe.save_phone(john_doe_phone)
    john_doe.save_phone(jane_doe_phone)
    expect(john_doe.list_phone_numbers).to eq "5552424\n3602424\n"
  end

  it "save email address to contact" do
    john_doe = Contact.new("John Doe")
    john_doe_email = Email.new("john.doe@gmail.com")
    john_doe.save_email(john_doe_email)
    expect(john_doe.emails).to eq [john_doe_email]
  end

  it "returns array of email addresses as formatted text" do
    john_doe = Contact.new("John Doe")
    john_doe_email = Email.new("john.doe@gmail.com")
    john_doe_work_email = Email.new("john.doe@work.com")
    john_doe.save_email(john_doe_email)
    john_doe.save_email(john_doe_work_email)
    expect(john_doe.list_email_addresses).to eq "john.doe@gmail.com\njohn.doe@work.com\n"
  end

  it 'saves address to contact' do
    john_doe = Contact.new("John Doe")
    john_doe_address = Address.new("1234 Easy Street", "Portland", "OR", 97201)
    john_doe.save_address(john_doe_address)
    expect(john_doe.addresses).to eq [john_doe_address]
  end

  it "returns array of addresses as formatted text" do
    john_doe = Contact.new("John Doe")
    john_doe_address = Address.new("1234 Easy Street", "Portland", "OR", 97201)
    john_doe.save_address(john_doe_address)
    john_doe_address2 = Address.new("1235 Easy Street", "Portland", "OR", 97202)
    john_doe.save_address(john_doe_address2)
    expect(john_doe.list_addresses).to eq "1234 Easy Street Portland OR 97201\n1235 Easy Street Portland OR 97202\n"
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


