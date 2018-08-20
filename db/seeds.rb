User.create!(name: "Example User", email: "huyencherry13796@gmail.com",
  password: "123456", password_confirmation: "123456", role: 1)

User.create!(name: "Huyen Cherry", email: "huyencherry137@gmail.com",
  password: "123456", password_confirmation: "123456", role: 0)

10.times do
  Course.create!(
    name: Faker::Cat.name,
    detail: Faker::Cat.registry,
    category: Faker::Number.between(0,1)
  )
end

2.times do
  UserCourse.create!(
    progress: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].sample,
    start_date: Faker::Date.between(20.days.ago, Date.today),
    end_date: Faker::Date.between(Date.today, 20.days.from_now),
    user_id: 1,
    course_id: rand(1..10)
  )
end

10.times do
  Subject.create!(
    name: Faker::Cat.name,
    detail: Faker::Cat.registry,
    category: Faker::Number.between(0,1),
    status: Faker::Number.between(0,1)
  )
end

2.times do
  UserSubject.create!(
    progress: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].sample,
    status: Faker::Number.between(0,1),
    start_date: Faker::Date.between(20.days.ago, Date.today),
    end_date: Faker::Date.between(Date.today, 20.days.from_now),
    user_id: 2,
    subject_id: rand(1..10),
    user_course_id: rand(1..2)
  )
end

10.times do
  UserReport.create!(
    title: Faker::Cat.name,
    content: Faker::Cat.registry,
    user_id: 2,
    user_subject_id: rand(1..2)
  )
end
