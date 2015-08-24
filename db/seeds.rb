# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create role_id: Role.list.customer, email: 'neo@zion.com',        password: 'kmcdka09', password_confirmation: 'kmcdka09'
User.create role_id: Role.list.agent,    email: 'smith@matrix.com',    password: 'kmcdka09', password_confirmation: 'kmcdka09'
User.create role_id: Role.list.admin,    email: 'morpheus@matrix.com', password: 'kmcdka09', password_confirmation: 'kmcdka09'