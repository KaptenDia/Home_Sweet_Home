class Product {
  final String image, detailImage, title, price, description;
  final int id, review;
  final double rating;

  Product({
    required this.image,
    required this.detailImage,
    required this.title,
    required this.price,
    required this.id,
    required this.review,
    required this.description,
    required this.rating,
  });
}

List<Product> products = [
  Product(
    image: 'assets/images/i1.png',
    detailImage: 'assets/images/image1.png',
    title: 'Black Simple Lamp',
    price: 'Rp. 1.155.780',
    review: 110,
    description:
        'Black simple lamp cocok untuk dijadikan lampu belajar dengan design minimalis dan elegan yang bukan hanya berfungsi sebagai penerangan saja,menjadikan Black Simple Lamp cocok juga digunakan untuk hiasan ruangan anda.',
    rating: 4,
    id: 1,
  ),
  Product(
    image: 'assets/images/i2.png',
    detailImage: 'assets/images/image2.png',
    title: 'Minimal Stand',
    price: 'Rp. 3.250.000',
    review: 50,
    description:
        'Stand Minimal terbuat dari kayu alami. Desain yang sangat sederhana dan minimalis. Ini benar-benar salah satu furnitur terbaik di keluarga mana pun untuk saat ini. Dengan 3 warna berbeda, Anda dapat dengan mudah memilih yang paling cocok untuk rumah Anda.',
    rating: 4.5,
    id: 2,
  ),
  Product(
    image: 'assets/images/i3.png',
    detailImage: 'assets/images/image3.png',
    title: 'Coffe Chair',
    price: 'Rp. 77.900',
    review: 71,
    description:
        'Dengan design minimalis dan simple Coffe Chair sangat cocok untuk anda yang ingin memiliki sebuah kursi yang fungsinya untuk duduk bersantay dengan meneguk sebuah coffe panas.tidak hanya itu saja untuk anda yang ingin membuka coffe shop Coffe Chair ini cocok unduk dijadikan sebagai kursi customer.',
    rating: 5,
    id: 3,
  ),
  Product(
    review: 712,
    image: 'assets/images/i4.png',
    detailImage: 'assets/images/image4.png',
    title: 'Simple Desk',
    price: 'Rp. 344.900',
    description:
        'Simple desk sangat minimalis dan berguna untuk menyimpan barang barang keperluan anda seperti buku,kosmetik dll.',
    rating: 3.5,
    id: 4,
  ),
];
