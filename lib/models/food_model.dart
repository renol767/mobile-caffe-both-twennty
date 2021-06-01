import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Food extends Equatable {
  final dynamic id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final dynamic price;
  final dynamic rate;

  Food({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
  });

  factory Food.fromJson(Map<String, dynamic> jsonData) => Food(
        id: jsonData['id'],
        name: jsonData["name"],
        description: jsonData["description"],
        ingredients: jsonData["ingredients"],
        price: int.parse(jsonData["price"]),
        rate: double.parse(jsonData["rate"]),
        picturePath: jsonData["picturePath"],
      );

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockFoods = [
  Food(
    id: 1,
    picturePath:
        "https://www.masakapahariini.com/wp-content/uploads/2019/01/nasi-goreng-jawa-500x300.jpg",
    name: "Nasi Goreng",
    description:
        "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak.",
    ingredients: "Bawang Merah, Paprika, Bawang Bombay, Timun",
    price: 150000,
    rate: 4.2,
  ),
  Food(
      id: 2,
      picturePath:
          "https://www.rukita.co/stories/wp-content/uploads/2020/02/byurger.jpg",
      name: "Burger",
      description:
          "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak.",
      ingredients: "Daging Sapi Korea, Garam, Lada Hitam",
      price: 750000,
      rate: 4.5),
  Food(
      id: 3,
      picturePath:
          "https://i1.wp.com/varminz.com/wp-content/uploads/2019/12/mexican-chopped-salad3.jpg?fit=843%2C843&ssl=1",
      name: "Mexican Chopped Salad",
      description:
          "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak.",
      ingredients: "Jagung, Selada, Tomat Ceri, Keju, Wortel",
      price: 105900,
      rate: 3.9),
  Food(
      id: 4,
      picturePath:
          "https://images.immediate.co.uk/production/volatile/sites/2/2016/08/25097.jpg?quality=90&resize=768,574",
      name: "Sup Wortel Pedas",
      description:
          "Sup wortel pedas yang unik ini cocok banget buat kalian-kalian yang suka pedas namun ingin tetap sehat. Rasanya yang unik akan memanjakan lidah Anda.",
      ingredients: "Wortel, Seledri, Kacang Tanah, Labu, Garam, Gula",
      price: 60000,
      rate: 4.9),
  Food(
      id: 5,
      picturePath:
          "https://cmxpv89733.i.lithium.com/t5/image/serverpage/image-id/478345i84598AB4FEB454CB/image-size/large?v=1.0&px=999",
      name: "Korean Raw Beef Tartare",
      description:
          "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak.",
      ingredients: "Daging Sapi Korea, Telur, Biji Wijen",
      price: 350000,
      rate: 3.4)
];
