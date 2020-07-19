# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
Maker.delete_all

Category.add 'Смартфоны', [
    {:name=> "Диагональ", :type => "Number", :id=>1},
    {:name=>"Изображения", :type=>"Images", :id=>2},
    {:name=>"Описание", :type=>"LongText", :id=>3},
    {:name=>"Чтото", :type=>"Text", :id=>4}
]

Category.add 'Телевизоры', [
    {:name=> "Диагональ", :type => "Number", :id=>1},
    {:name=>"Изображения", :type=>"Images", :id=>2},
    {:name=>"Описание", :type=>"LongText", :id=>3},
    {:name=>"Количество цветов", :type=>"Number", :id=>4},
    {:name=>"Умное ТВ", :type=>"Bool", :id=>5},
]
another = Maker.create(name: 'Другое')
makers = [

    Maker.create(name: 'Apple'),
    Maker.create(name: 'Samsung'),
    Maker.create(name: 'Xiaomi'),

]

Category.where(name:"Смартфоны").first.makers << makers
Category.where(name:"Смартфоны").first.makers << another
Category.where(name:"Телевизоры").first.makers << makers[1]
Category.where(name:"Телевизоры").first.makers <<  Maker.create(name: 'Sony')
Category.where(name:"Телевизоры").first.makers <<  Maker.create(name: 'Polar')
Category.where(name:"Телевизоры").first.makers <<  another
