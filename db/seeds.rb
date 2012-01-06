# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Policy.delete_all
PolicyHolder.delete_all
Beneficiary.delete_all
User.delete_all

User.create!([
  { login: "okouam", password: "changeme", email: "olivier.kouame@gmail.com", password_confirmation: "changeme",
    role: "Administator", status: "Active"},
  { login: "paul", password: "changeme", email: "paul@gmail.com", password_confirmation: "changeme", role: "Administrator",
    status: "Active"},
  { login: "brice", password: "changeme", email: "brice@gmail.com", password_confirmation: "changeme", role: "Administrator",
    status: "Active"},
  { login: "johnny", password: "changeme", email: "johnny@gmail.com", password_confirmation: "changeme", role: "Agent",
    status: "Active"},
  { login: "ricardo", password: "changeme", email: "ricardo@gmail.com", password_confirmation: "changeme", role: "Agent",
    status: "Blocked"},
  { login: "fifi", password: "changeme", email: "fifi@gmail.com", password_confirmation: "changeme", role: "Employee",
    status: "Active"},
  { login: "suzanne", password: "changeme", email: "suzanne@gmail.com", password_confirmation: "changeme", role: "Employee",
    status: "Blocked"}
])

PolicyHolder.create!([
  { first_name: "Olivier", middle_names: "Zegbeh N'Guessan", last_name: "Kouame", title: "Mr", dob: "1981-04-13",
    employer: "Videojug Ltd", user: User.find_by_login("paul"), address: Address.new({
      address_line_1: "23 Stroud Purple Road", address_line_2: "Finsbury Park", postcode: "N3 2PS", postal_town: "London",
      country: "United Kingdom", county: "London"
  })},
  { first_name: "Cindy", middle_names: "Rudolph Patrick", last_name: "Smith", title: "Miss", dob: "1924-11-20",
    employer: "Homebase Ltd", user: User.find_by_login("brice"), address: Address.new({
  })},
  { first_name: "Obama", middle_names: "Tony", last_name: "Clinton", title: "Mr", dob: "1934-07-23",
    employer: "United States Senate", user: User.find_by_login("brice"), address: Address.new({
  })},
  { first_name: "Jeffrey", middle_names: "", last_name: "Hearst", title: "Dr", dob: "1988-02-11",
    employer: "BT", user: User.find_by_login("paul"), address: Address.new({
  })},
  { first_name: "Lucy", middle_names: "Miranda Helen", last_name: "Bonham-Carter", title: "Mrs", dob: "1948-12-01",
    employer: "Miramax Films", user: User.find_by_login("johnny"), address: Address.new({
  })}
])

Policy.create!([
  { user: User.find_by_login("brice"), policy_number: "AB234", status: "ACTIVE", category: "General - Regular",
    policy_holder: PolicyHolder.find_by_last_name("Kouame") },
  { user: User.find_by_login("brice"), policy_number: "DS3943", status: "INACTIVE", category: "General - Regular",
    policy_holder: PolicyHolder.find_by_last_name("Kouame") },
  { user: User.find_by_login("brice"), policy_number: "BFG33434", status: "ACTIVE", category: "Senior - Premium",
    policy_holder: PolicyHolder.find_by_last_name("Kouame") },
  { user: User.find_by_login("paul"), policy_number: "DS3434", status: "ACTIVE", category: "General - Premium",
    policy_holder: PolicyHolder.find_by_last_name("Smith") },
  { user: User.find_by_login("paul"), policy_number: "BG4345", status: "INACTIVE", category: "Senior - Premium",
    policy_holder: PolicyHolder.find_by_last_name("Clinton") },
  { user: User.find_by_login("johnny"), policy_number: "HJ3253", status: "ACTIVE", category: "Senior - Regular",
    policy_holder: PolicyHolder.find_by_last_name("Hearst") },
  { user: User.find_by_login("johnny"), policy_number: "KJ3253", status: "ACTIVE", category: "Senior - Regular",
    policy_holder: PolicyHolder.find_by_last_name("Bonham-Carter") },
])

Beneficiary.create!([
  { policy: Policy.find_by_policy_number("AB234"), first_name: "Karen", last_name: "Fisher", dob: "1928-04-12",
    relationship: "daughter"}
])