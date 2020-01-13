# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{name: 'Иван'},{name: 'Петр'}])

category = Category.create!(title: 'Ruby')

test = Test.create!(title: 'Ruby начальный', level: 0, category_id: category.id)

question = Question.create!(body: 'Укажите результат выражения 1++ ',
                            test_id: test.id)

Answer.create!(body: '1', correct: false, question_id: question.id)
Answer.create!(body: '2', correct: true, question_id: question.id)
Answer.create!(body: '4', correct: false, question_id: question.id)

question = Question.create!(body: 'Какой метод позволяет привести'\
                                 ' строку в нижний регистр:',
                            test_id: test.id)

Answer.create!(body: 'lowercase()', correct: false, question_id: question.id)
Answer.create!(body: 'down()', correct: false, question_id: question.id)
Answer.create!(body: 'downcase()', correct: true, question_id: question.id)

test = Test.create!(title: 'Ruby продвинутый', level: 1, category_id: category.id)

question = Question.create!(body: 'Чем отличается puts от print:', test_id: test.id)

Answer.create!(body: 'Ничем, оба делают одно и тоже',
               correct: true,
               question_id: question.id)
Answer.create!(body: 'print без пропуска строки, а puts с пропуском',
               correct: true,
               question_id: question.id)
Answer.create!(body: 'puts позволяет выводить переменные,' \
                               ' а print только текст',
               correct: false,
               question_id: question.id)

question = Question.create!(body: 'Создатель Ruby:', test_id: test.id)

Answer.create!(body: 'Билл Гейтц', correct: false, question_id: question.id)
Answer.create!(body: 'Марк Цукербург', correct: false, question_id: question.id)
Answer.create!(body: 'Юкихиро Мацумото', correct: true, question_id: question.id)

UserTest.create!(user_id: users[0].id, test_id: test.id)

category = Category.create!(title: 'Ruby on Rails')

test = Test.create!(title: 'Rails начальный', level: 0, category_id: category.id)

question = Question.create!(body: 'В каком году создан Ruby on Rails:',
                            test_id: test.id)
Answer.create!(body: '2004-2005', correct: true, question_id: question.id)
Answer.create!(body: '1974-1978', correct: false, question_id: question.id)
Answer.create!(body: '2008', correct: false, question_id: question.id)

question = Question.create!(body: 'Кто создал Ruby on Rails:', test_id: test.id)

Answer.create!(body: 'Юкихиро Мацумото', correct: false, question_id: question.id)
Answer.create!(body: 'Билл Гейтц', correct: false, question_id: question.id)
Answer.create!(body: 'Давид Ханссон', correct: true, question_id: question.id)

UserTest.create!(user_id: users[1].id, test_id: test.id)

test = Test.create!(title: 'Rails продвинутый', level: 1, category_id: category.id)

question = Question.create!(body: ' MVC это:', test_id: test.id)

Answer.create!(body: 'Model, View, Controller',
               correct: true,
               question_id: question.id)
Answer.create!(body: 'Mobile, Version, Constant',
               correct: false,
               question_id: question.id)
Answer.create!(body: 'Movie, View, Cinema',
               correct: false,
               question_id: question.id)

question = Question.create!(body: 'Наследником какого класса' \
                                 ' представлена модель:',
                            test_id: test.id)

Answer.create!(body: 'ActionFiction', correct: false, question_id: question.id)
Answer.create!(body: 'ActiveData', correct: false, question_id: question.id)
Answer.create!(body: 'ActiveRecord', correct: true, question_id: question.id)


