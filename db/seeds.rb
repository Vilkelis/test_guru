# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{name: 'Иван', email: 'ivan@yandex.ru',
                       password: 'ivanivan', password_confirmation: 'ivanivan'},
                      {name: 'Петр', email: 'petr@yandex.ru',
                       password: 'petrpetr', password_confirmation: 'petrpetr'}])
users.each{ |u| u.confirm }

admin = Admin.create!(name: 'Админ', surname: 'Админов',
                       email: 'admin@yandex.ru',
                       password: 'adminadmin',
                       password_confirmation: 'adminadmin')
admin.confirm

categories = Category.create!([{title: 'Ruby'},{title: 'Ruby on Rails'}])

tests = []
tests << Test.create!(title: 'Ruby начальный', level: 0, category: categories[0], author: admin)
tests << Test.create!(title: 'Ruby продвинутый', level: 2, category: categories[0], author: admin)
tests << Test.create!(title: 'Rails начальный', level: 1, category: categories[1], author: admin)
tests << Test.create!(title: 'Rails продвинутый', level: 2, category: categories[1], author: admin)

questions = []
questions << Question.create!(body: 'Укажите результат выражения 1++ ',
                              test: tests[0])
questions << Question.create!(body: 'Какой метод позволяет привести'\
                                 ' строку в нижний регистр:',
                              test: tests[0])

questions << Question.create!(body: 'Чем отличается puts от print:', test: tests[1])
questions << Question.create!(body: 'Создатель Ruby:', test: tests[1])

questions << Question.create!(body: 'В каком году создан Ruby on Rails:',
                             test: tests[2])
questions << Question.create!(body: 'Кто создал Ruby on Rails:', test: tests[2])
questions << Question.create!(body: ' MVC это:', test: tests[3])
questions << Question.create!(body: 'Наследником какого класса' \
                                  ' представлена модель:',
                              test: tests[3])

Answer.create!(body: '1', correct: false, question: questions[0])
Answer.create!(body: '2', correct: true, question: questions[0])
Answer.create!(body: '4', correct: false, question: questions[0])

Answer.create!(body: 'lowercase()', correct: false, question: questions[1])
Answer.create!(body: 'down()', correct: false, question: questions[1])
Answer.create!(body: 'downcase()', correct: true, question: questions[1])

Answer.create!(body: 'Ничем, оба делают одно и тоже',
               correct: true,
               question: questions[2])
Answer.create!(body: 'print без пропуска строки, а puts с пропуском',
               correct: true,
               question: questions[2])
Answer.create!(body: 'puts позволяет выводить переменные,' \
                               ' а print только текст',
               correct: false,
               question: questions[2])

Answer.create!(body: 'Билл Гейтц', correct: false, question: questions[3])
Answer.create!(body: 'Марк Цукербург', correct: false, question: questions[3])
Answer.create!(body: 'Юкихиро Мацумото', correct: true, question: questions[3])

Answer.create!(body: '2004-2005', correct: true, question: questions[4])
Answer.create!(body: '1974-1978', correct: false, question:  questions[4])
Answer.create!(body: '2008', correct: false, question:  questions[4])

Answer.create!(body: 'Юкихиро Мацумото', correct: false, question: questions[5])
Answer.create!(body: 'Билл Гейтц', correct: false, question: questions[5])
Answer.create!(body: 'Давид Ханссон', correct: true, question: questions[5])

Answer.create!(body: 'Model, View, Controller',
               correct: true,
               question:  questions[6])
Answer.create!(body: 'Mobile, Version, Constant',
               correct: false,
               question:  questions[6])
Answer.create!(body: 'Movie, View, Cinema',
               correct: false,
               question:  questions[6])

Answer.create!(body: 'ActionFiction', correct: false, question:  questions[7])
Answer.create!(body: 'ActiveData', correct: false, question:  questions[7])
Answer.create!(body: 'ActiveRecord', correct: true, question:  questions[7])
