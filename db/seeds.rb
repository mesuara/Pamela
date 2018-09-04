# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Admin.create(name: 'test', last_name: 'test', email: 'test@test.com', password: '123')

# Course.create(name:'SEI', total_hours: 480)
# Instructor.create(name: 'David', last_name: 'Patlut', age: 100, salary: 1, education: "Bachelor Degree", email: "db@email.com", password: "123", user_id: 3)
# Cohort.create(name: 'Summer', start_date: DateTime.new(2018,6,18), end_date: DateTime.new(2018,9,26), instructor_id: 1, course_id: 1)
# Student.create(name: 'Lily', last_name: 'Ngo', age: 20, email: 'lily@gmail.com', password: '321', cohort_id: 1)

User.create!(email: "test@gmail.com", password: "123456", admin: true)