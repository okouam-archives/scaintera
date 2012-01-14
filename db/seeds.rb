load "#{Rails.root}/db/faker_extensions.rb"

Policy.delete_all
PolicyHolder.delete_all
Beneficiary.delete_all
User.delete_all

def find_user
  users = User.all
  users[Random.rand(users.count)]
end

def find_policy_holder
  policy_holders = PolicyHolder.all
  policy_holders[Random.rand(policy_holders.count)]
end

def find_policy
  policies = Policy.all
  policies[Random.rand(policies.count)]
end

User.create!([
  { login: "okouam", password: "changeme", email: Faker::Internet.email, password_confirmation: "changeme",
    role: "administrator", status: "active"},
  { login: "paul", password: "changeme", email: Faker::Internet.email, password_confirmation: "changeme", role: "administrator",
    status: "active"},
  { login: "brice", password: "changeme", email: Faker::Internet.email, password_confirmation: "changeme", role: "administrator",
    status: "active"},
  { login: "johnny", password: "changeme", email: Faker::Internet.email, password_confirmation: "changeme", role: "agent",
    status: "active"},
  { login: "ricardo", password: "changeme", email: Faker::Internet.email, password_confirmation: "changeme", role: "agent",
    status: :blocked},
  { login: "fifi", password: "changeme", email: Faker::Internet.email, password_confirmation: "changeme", role: "auditor",
    status: "active"},
  { login: "suzanne", password: "changeme", email: Faker::Internet.email, password_confirmation: "changeme", role: "auditor",
    status: :blocked}
])

1..20.times do
  PolicyHolder.create!(
    { names: Faker::Name.first_name,
      surname: Faker::Name.last_name,
      dob: Faker::Person.dob,
      gender: Faker::Person.gender,
      email: Faker::Internet.email,
      postcode: Faker::Address.postcode,
      city: Faker::Address.city,
      user: find_user,
      address: Faker::Address.street_address,
      mobile_phone: Faker::PhoneNumber.cell_phone,
      home_phone: Faker::PhoneNumber.phone_number,
      rents_property: Faker::Logic.boolean,
      owns_property: Faker::Logic.boolean,
      uses_money_transfers: Faker::Logic.boolean
    }
  )
end

1..30.times do
  Policy.create!({
    user: find_user,
    status: Faker::Policy.status,
    category: Faker::Policy.category,
    policy_holder: find_policy_holder
  })
end

1..60.times do
  Beneficiary.create!({
    policy: find_policy,
    names: Faker::Name.first_name,
    telephone: Faker::PhoneNumber.phone_number,
    surname: Faker::Name.last_name,
    dob: Faker::Person.dob,
    relationship: Faker::Person.relationship
  })
end

1..40.times do
  InsuranceProduct.create!({
    policy_holder: find_policy_holder,
    cover: Faker::InsuranceProduct.cover,
    expiry_date: Faker::Name.last_name,
    premium_amount: Random.rand(100) + 10
  })
end

