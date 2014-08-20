require 'faker'

10.times do |i|
  Day.create({
    :date => Time.now.strftime("%^A")
  })
  Recipe.create({
    :name => Faker::Lorem.sentence
    :amount => Faker::Number.digit
    })
  Ingredient.create({
    :name => Faker::Lorem.sentence
    :amount => Faker::Number.digit
    })
  Meal.create({
    :name => Faker::Lorem.sentence
    :day => Date.today.strftime("%^A")
    })
end

