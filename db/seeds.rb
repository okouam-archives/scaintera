# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Policy.delete_all
PolicyHolder.delete_all
User.delete_all

User.create!([
  { login: "okouam", password: "changeme", email: "olivier.kouame@gmail.com", password_confirmation: "changeme" },
  { login: "paul", password: "changeme", email: "paul@gmail.com", password_confirmation: "changeme" },
  { login: "brice", password: "changeme", email: "brice@gmail.com", password_confirmation: "changeme" },
  { login: "johnny", password: "changeme", email: "johnny@gmail.com", password_confirmation: "changeme" }
])

PolicyHolder.create!([
  { first_name: "Olivier", middle_names: "Zegbeh N'Guessan", last_name: "Kouame" },
  { first_name: "John", middle_names: "Rudolph Patrick", last_name: "Smith" },
  { first_name: "Obama", middle_names: "Tony", last_name: "Clinton" },
  { first_name: "Jeffrey", middle_names: "", last_name: "Hearst" },
  { first_name: "Lucy", middle_names: "Miranda Helen", last_name: "Bonham-Carter" }
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