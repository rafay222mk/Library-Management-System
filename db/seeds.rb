# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(
  email: 'admin@gmail.com',
  password: 'admin22',
  user_name: 'admin',
  role: 'admin'
)
User.create(
  email: 'librarian1@gmail.com',
  password: 'librarian1',
  user_name: 'ibrarian 1',
  role: 'libraian'
)
User.create(
  email: 'abdul@gmail.com',
  password: 'abdul2',
  user_name: 'abdul',
  role: 'student'
)