# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Maker.destroy_all
Shop.destroy_all
Product.destroy_all
Attribute.destroy_all
Wish.destroy_all
Cart.destroy_allws
Order.destroy_all
User.destroy_all



test_user = User.new(name: 'John', surname: 'Doe', password: '12345678', password_confirmation: '12345678', phone: '88005553535', email: 'john.doe@gmail.com', confirmed: true)
test_user.restore_date = Time.now.getutc
test_user.save
Shop.create(name: 'China International', user_id: test_user.id)
Shop.create(name: 'РашнБестБайСторЕвер', user_id: test_user.id)
Shop.create(name: 'Семерочка', user_id: test_user.id)


Category.add 'Компьютерные мыши', [
    {:name=> "Разрешение cенсора", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "DPI", is_int: true},
    {:name=>"Изображения", :type=>"Images", :id=>2, :min=>nil, :max=>nil, hint: nil},
    {:name=>"Высота", :type=>"Number", :id=>3, :min=>0, :max=>nil, hint: "мм", is_int: true},
    {:name=>"Ширина", :type=>"Number", :id=>4, :min=>0, :max=>nil, hint: "мм", is_int: true},
    {:name=>"Масса", :type=>"Number", :id=>5, :min=>0, :max=>nil, hint: "г", is_int: true}
]

Category.add 'Смартфоны', [
    {:name=> "Диагональ", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: nil, is_int: false },
    {:name=>"Изображения", :type=>"Images", :id=>2, :min=>nil, :max=>nil, hint: nil},
    {:name=>"Чтото", :type=>"Text", :id=>3, :min=>nil, :max=>nil, hint: nil}
]

Category.add 'Телевизоры', [
    {:name=> "Диагональ", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: nil, is_int: false},
    {:name=>"Изображения", :type=>"Images", :id=>2, :min=>nil, :max=>nil, hint: nil},
    {:name=>"Количество цветов", :type=>"Number", :id=>3, :min=>0, :max=>nil, hint: nil, is_int: true},
    {:name=>"Умное ТВ", :type=>"Bool", :id=>4, :min=>nil, :max=>nil, hint: nil},
]
another = Maker.create(name: 'Другое', is_another:true)

makers = [

    Maker.create(name: 'Apple', is_another:false),
    Maker.create(name: 'Samsung', is_another:false ),
    Maker.create(name: 'Xiaomi', is_another:false ),

]

Category.where(name:"Смартфоны").first.makers << makers
Category.where(name:"Компьютерные мыши").first.makers << makers
Category.where(name:"Компьютерные мыши").first.makers << another
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

