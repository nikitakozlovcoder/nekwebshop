# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
Maker.delete_all
Shop.delete_all
Product.delete_all




Shop.create(name: 'China International')
Shop.create(name: 'РашнБестБайСторЕвер')
Shop.create(name: 'Семерочка')




Category.add 'Смартфоны', [
    {:name=> "Диагональ", :type => "Number", :id=>1, :min=>0, :max=>nil},
    {:name=>"Изображения", :type=>"Images", :id=>2, :min=>nil, :max=>nil},
    {:name=>"Чтото", :type=>"Text", :id=>3, :min=>nil, :max=>nil}
]

Category.add 'Телевизоры', [
    {:name=> "Диагональ", :type => "Number", :id=>1, :min=>0, :max=>nil},
    {:name=>"Изображения", :type=>"Images", :id=>2, :min=>nil, :max=>nil},
    {:name=>"Количество цветов", :type=>"Number", :id=>3, :min=>0, :max=>nil},
    {:name=>"Умное ТВ", :type=>"Bool", :id=>4, :min=>nil, :max=>nil},
]
another = Maker.create(name: 'Другое', is_another:true)

makers = [

    Maker.create(name: 'Apple', is_another:false),
    Maker.create(name: 'Samsung', is_another:false ),
    Maker.create(name: 'Xiaomi', is_another:false ),

]

Category.where(name:"Смартфоны").first.makers << makers
Category.where(name:"Смартфоны").first.makers << another
Category.where(name:"Телевизоры").first.makers << makers[1]
Category.where(name:"Телевизоры").first.makers <<  Maker.create(name: 'Sony', is_another:false )
Category.where(name:"Телевизоры").first.makers <<  Maker.create(name: 'Polar', is_another:false )
Category.where(name:"Телевизоры").first.makers <<  another


tech = Category.create(name: "Техника")
electric = Category.create(name: "Электроника", parent: tech)
phones = Category.create(name: "Телефоны", parent: electric)

c1 = Category.where(name:"Смартфоны").first
c1.parent = phones
c1.save

c2 = Category.where(name:"Телевизоры").first
c2.parent = electric
c2.save

