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
Cart.destroy_all
Order.destroy_all
User.destroy_all



test_user = User.new(name: 'John', surname: 'Doe', password: '12345678', password_confirmation: '12345678', phone: '88005553535', email: 'john.doe@gmail.com', confirmed: true)
test_user.restore_date = Time.now.getutc
test_user.save
Shop.create(name: 'China International', user_id: test_user.id)
Shop.create(name: 'РашнБестБайСторЕвер', user_id: test_user.id)
Shop.create(name: 'Семерочка', user_id: test_user.id)
#Производители
another = Maker.create(name: 'Другое', is_another:true)

makers = [

    Maker.create(name: 'Apple', is_another:false),
    Maker.create(name: 'Samsung', is_another:false ),
    Maker.create(name: 'Xiaomi', is_another:false ),
    Maker.create(name: 'Sony', is_another:false ),
    Maker.create(name: 'Polar', is_another:false )
]

#Продукты питания
#Категории с полями
Category.add 'Творожные изделия', [
    {:name=> "Срок годности", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "Дней", is_int: true},
    {:name=> "Вес", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "г", is_int: true},
    {:name=> "Жирность", :type => "Number", :id=>3, :min=>0, :max=>nil, hint: "%", is_int: false},
    {:name=> "С заменителем жира", :type => "Bool", :id=>4, :min=>nil , :max=>nil, hint: nil}

]
Category.add 'Кисломолочные продукты', [
    {:name=> "Срок годности", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "Дней", is_int: true},
    {:name=> "Объем", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "мл", is_int: true},
    {:name=> "Жирность", :type => "Number", :id=>3, :min=>0, :max=>nil, hint: "%", is_int: false},
    {:name=> "С заменителем жира", :type => "Bool", :id=>4, :min=>nil , :max=>nil, hint: nil}
]
Category.add 'Хлеб', [
    {:name=> "Срок годности", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "Дней", is_int: true},
    {:name=> "Вес", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "г", is_int: true},
    {:name=> "Состав", :type => "LongText", :id=>3, :min=>nil, :max=>nil, hint: nil},
    {:name=> "Нарезной", :type => "Bool", :id=>4, :min=>nil , :max=>nil, hint: nil}

]
Category.add 'Выпечка', [
    {:name=> "Срок годности", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "Дней", is_int: true},
    {:name=> "Вес", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "г", is_int: true},
    {:name=> "Состав", :type => "LongText", :id=>3, :min=>nil, :max=>nil, hint: nil},

]
Category.add 'Рыба', [
    {:name=> "Срок годности", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "Дней", is_int: true},
    {:name=> "Вес", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "г", is_int: true},
]
Category.add 'Мясо', [
    {:name=> "Срок годности", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "Дней", is_int: true},
    {:name=> "Вес", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "г", is_int: true},
    {:name=> "Тип хранения", :type => "Text", :id=>3, :min=>nil, :max=>nil, hint: nil},
]
Category.add 'Овощи', [
    {:name=> "Срок годности", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "Дней", is_int: true},
    {:name=> "Вес", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "г", is_int: true},
    {:name=> "Расфасовка", :type => "Text", :id=>3, :min=>nil, :max=>nil, hint: nil},
    {:name=> "Вид готовности", :type => "Text", :id=>4, :min=>nil, :max=>nil, hint: nil},
]
#Дерево
с1 = Category.create(name: "Продукты питания")
с2 = Category.create(name: "Молочные продукты", parent: с1)
с3 = Category.create(name: "Хлебобулочные изделия", parent: с1)
a1 = Category.where(name:"Творожные изделия").first
a1.makers << another
a1.parent = с2
a1.save
a2 = Category.where(name:"Кисломолочные продукты").first
a2.makers << another
a2.parent = с2
a2.save
a3 = Category.where(name:"Хлеб").first
a3.makers << another
a3.parent = с3
a3.save
a4 = Category.where(name:"Выпечка").first
a4.makers << another
a4.parent = с3
a4.save
a5 = Category.where(name:"Мясо").first
a5.makers << another
a5.parent = с1
a5.save
a5 = Category.where(name:"Рыба").first
a5.makers << another
a5.parent = с1
a5.save
a5 = Category.where(name:"Овощи").first
a5.makers << another
a5.parent = с1
a5.save

#Одежда и обувь
#Категории с полями
Category.add 'Обувь', [
    {:name=> "Размер", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: nil, is_int: true},
    {:name=> "Материал(внешний)", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Материал подошвы", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},
    {:name=> "Материал(внутренний)", :type => "Text", :id=>4, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет", :type => "Text", :id=>5, :min=>0, :max=>nil, hint: nil},

]
Category.add 'Джинсы', [
    {:name=> "Размер", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: nil, is_int: true},
    {:name=> "Материал", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},

]
Category.add 'Рубашки', [
    {:name=> "Размер", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: nil, is_int: true},
    {:name=> "Материал", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},
    {:name=> "Размер воротника", :type => "Number", :id=>4, :min=>0, :max=>nil, hint: nil, is_int: true},
]
Category.add 'Свитера', [
    {:name=> "Размер", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: nil, is_int: true},
    {:name=> "Материал", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},
]
Category.add 'Зимние куртки', [
    {:name=> "Размер", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: nil, is_int: true},
    {:name=> "Материал", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},
    {:name=> "Натуральный мех", :type => "Bool", :id=>4, :min=>nil , :max=>nil, hint: nil}
]
Category.add 'Осенние куртки', [
    {:name=> "Размер", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: nil, is_int: true},
    {:name=> "Материал", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil}
]
#Дерево
с1 = Category.create(name: "Одежда и обувь")
с2 = Category.create(name: "Куртки", parent: с1)
a1 = Category.where(name:"Обувь").first
a1.makers << another
a1.parent = с1
a1.save
a1 = Category.where(name:"Джинсы").first
a1.makers << another
a1.parent = с1
a1.save
a1 = Category.where(name:"Рубашки").first
a1.makers << another
a1.parent = с1
a1.save
a1 = Category.where(name:"Свитера").first
a1.makers << another
a1.parent = с1
a1.save
a1 = Category.where(name:"Зимние куртки").first
a1.makers << another
a1.parent = с2
a1.save
a1 = Category.where(name:"Осенние куртки").first
a1.makers << another
a1.parent = с2
a1.save
#Цифровая техника
#Категории с полями
Category.add 'Фото и видео-техника', [
    {:name=> "Зеркальный", :type => "Bool", :id=>1, :min=>nil , :max=>nil, hint: nil},
    {:name=> "Максимальное увеличение", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: nil, is_int: true},
    {:name=> "Разрешение", :type => "Number", :id=>3, :min=>0, :max=>nil, hint: "пикселей", is_int: true},
    {:name=> "Вспышка", :type => "Bool", :id=>4, :min=>nil , :max=>nil, hint: nil},

]
Category.add 'Смартфоны', [
    {:name=> "Диагональ", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "пикселей", is_int: false},
    {:name=> "Процессор", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Объем ОЗУ", :type => "Number", :id=>3, :min=>0, :max=>nil, hint: "gb", is_int: true},
    {:name=> "Объем ОЗУ", :type => "Number", :id=>4, :min=>0, :max=>nil, hint: "gb", is_int: true},
    {:name=> "Слот под карту памяти", :type => "Bool", :id=>5, :min=>nil , :max=>nil, hint: nil},
    {:name=> "WI-FI", :type => "Bool", :id=>6, :min=>nil , :max=>nil, hint: nil},
    {:name=> "GPS", :type => "Bool", :id=>7, :min=>nil , :max=>nil, hint: nil},
    {:name=> "Разрешение камеры", :type => "Number", :id=>8, :min=>0, :max=>nil, hint: "MP", is_int: true},
    {:name=> "Влагозащита", :type => "Bool", :id=>9, :min=>nil , :max=>nil, hint: nil},
    {:name=> "NFC", :type => "Bool", :id=>10, :min=>nil , :max=>nil, hint: nil},
    {:name=> "Емкость аккумулятора", :type => "Number", :id=>11, :min=>nil , :max=>nil, hint: nil, is_int: true},
    {:name=> "Операционная система", :type => "Text", :id=>12, :min=>nil , :max=>nil, hint: nil}
]
Category.add 'Клавиатуры', [
    {:name=> "Игровая", :type => "Bool", :id=>1, :min=>nil , :max=>nil, hint: nil},
    {:name=> "Тип клавиш", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Тип подключения", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет", :type => "Text", :id=>4, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет подсветки", :type => "Text", :id=>5, :min=>0, :max=>nil, hint: nil},
    {:name=> "Количество клавиш", :type => "Number", :id=>6, :min=>0, :max=>nil, hint: "gb", is_int: true},
    {:name=> "Подсветка", :type => "Bool", :id=>7, :min=>nil , :max=>nil, hint: nil},

]
Category.add 'Компьютерные мыши', [
    {:name=> "Игровая", :type => "Bool", :id=>1, :min=>nil , :max=>nil, hint: nil},
    {:name=> "Разрешение сенсора", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "DPI", is_int: true},
    {:name=> "Тип подключения", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет", :type => "Text", :id=>4, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет подсветки", :type => "Text", :id=>5, :min=>0, :max=>nil, hint: nil},
    {:name=> "Количество клавиш", :type => "Number", :id=>6, :min=>0, :max=>nil, hint: "gb", is_int: true},
    {:name=> "Подсветка", :type => "Bool", :id=>7, :min=>nil , :max=>nil, hint: nil},
]
#Дерево
с1 = Category.create(name: "Цифровая техника")
с2 = Category.create(name: "Переферия", parent: с1)
a1 = Category.where(name:"Фото и видео-техника").first
a1.makers << another
a1.parent = с1
a1.save
a1 = Category.where(name:"Смартфоны").first
a1.makers << another
a1.parent = с1
a1.save
a1 = Category.where(name:"Компьютерные мыши").first
a1.makers << another
a1.parent = с2
a1.save
a1 = Category.where(name:"Клавиатуры").first
a1.makers << another
a1.parent = с2
a1.save

#Товары для дома
#Категории с полями
Category.add 'Миксеры', [
    {:name=> "Максимальная мощность", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "ВТ", is_int: true},
    {:name=> "Планетарное вращение насадок", :type => "Bool", :id=>2, :min=>nil , :max=>nil, hint: nil},
    {:name=> "Крюки для замешивания теста", :type => "Bool", :id=>3, :min=>0, :max=>nil, hint: nil},
    {:name=> "Объем чаши", :type => "Number", :id=>4, :min=>0, :max=>nil, hint: "Л", is_int: false},
    {:name=> "Материал корпуса", :type => "Text", :id=>5, :min=>0, :max=>nil, hint: nil},
    {:name=> "Насадка-блендер", :type => "Bool", :id=>6, :min=>nil , :max=>nil, hint: nil},
]
Category.add 'Обогреватели', [
    {:name=> "Максимальная мощность", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "ВТ", is_int: true},
    {:name=> "Площадь обогрева", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "кв.м", is_int: false},
    {:name=> "Количество секций", :type => "Number", :id=>3, :min=>0, :max=>nil, hint:  nil, is_int: true},
    {:name=> "Вентилятор", :type => "Bool", :id=>4, :min=>nil , :max=>nil, hint: nil},
    {:name=> "Термостат", :type => "Bool", :id=>5, :min=>nil , :max=>nil, hint: nil},
    {:name=> "Таймер", :type => "Bool", :id=>6, :min=>nil , :max=>nil, hint: nil},

]
Category.add 'Ножи', [
    {:name=> "Длина", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "см", is_int: true},
    {:name=> "Материал режущей части", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Материал ручки", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},
    {:name=> "Зазубренность", :type => "Bool", :id=>4, :min=>nil , :max=>nil, hint: nil},
]
Category.add 'Сервировка', [
    {:name=> "Количество в наборе", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: nil, is_int: true},
    {:name=> "Материал", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil}

]
Category.add 'Кастрюли', [
    {:name=> "Объем", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "мл", is_int: true},
    {:name=> "Материал", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Покрытие", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},


]

Category.add 'Сковородки', [
    {:name=> "Диаметр", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "см", is_int: true},
    {:name=> "Материал", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Покрытие", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},


]
Category.add 'Лампы', [
    {:name=> "Мощность", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "ВТ", is_int: true},
    {:name=> "Световой поток", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "Лм", is_int: true},
    {:name=> "Цветовая температура", :type => "Number", :id=>3, :min=>0, :max=>nil, hint: "К", is_int: true},
    {:name=> "Энергосберегающая", :type => "Bool", :id=>4, :min=>nil , :max=>nil, hint: nil},

]
Category.add 'Вазы', [
    {:name=> "Размер", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: nil, is_int: true},
    {:name=> "Материал", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil}
]
Category.add 'Полки', [
    {:name=> "Длина", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "см", is_int: true},
    {:name=> "Материал", :type => "Text", :id=>2, :min=>0, :max=>nil, hint: nil},
    {:name=> "Цвет", :type => "Text", :id=>3, :min=>0, :max=>nil, hint: nil},

]
Category.add 'Порошки', [
    {:name=> "Вес", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "кг", is_int: false},
    {:name=> "Срок годности", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "мес", is_int: false},

]
Category.add 'Отбеливатели', [
    {:name=> "Вес", :type => "Number", :id=>1, :min=>0, :max=>nil, hint: "кг", is_int: false},
    {:name=> "Срок годности", :type => "Number", :id=>2, :min=>0, :max=>nil, hint: "мес", is_int: false},

]
#Дерево
с1 = Category.create(name: "Товары для дома")
с2 = Category.create(name: "Бытовая техника", parent: с1)
с3 = Category.create(name: "Товары для кухни", parent: с1)
с4 = Category.create(name: "Посуда", parent: с3)
с5 = Category.create(name: "Интерьер", parent: с1)
с6 = Category.create(name: "Бытовая химия", parent: с1)
a1 = Category.where(name:"Миксеры").first
a1.makers << another
a1.parent = с2
a1.save
a1 = Category.where(name:"Обогреватели").first
a1.makers << another
a1.parent = с2
a1.save
a1 = Category.where(name:"Ножи").first
a1.makers << another
a1.parent = с3
a1.save
a1 = Category.where(name:"Сервировка").first
a1.makers << another
a1.parent = с3
a1.save
a1 = Category.where(name:"Сковородки").first
a1.makers << another
a1.parent = с4
a1.save
a1 = Category.where(name:"Кастрюли").first
a1.makers << another
a1.parent = с4
a1.save
a1 = Category.where(name:"Лампы").first
a1.makers << another
a1.parent = с5
a1.save
a1 = Category.where(name:"Вазы").first
a1.makers << another
a1.parent = с5
a1.save
a1 = Category.where(name:"Полки").first
a1.makers << another
a1.parent = с5
a1.save
a1 = Category.where(name:"Порошки").first
a1.makers << another
a1.parent = с6
a1.save
a1 = Category.where(name:"Отбеливатели").first
a1.makers << another
a1.parent = с6
a1.save
