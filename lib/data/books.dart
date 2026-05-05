class Book {
  final String title;
  final String author;

  const Book({required this.title, required this.author});
}

// not exactly how we did it in hw3, but I figured this is acceptable for this hw
const books = [
  Book(title: 'Da Vinci Code', author: 'Dan Brown'),
  Book(title: 'Mobile App Development', author: 'Mehmet Artun'),
  Book(title: 'Algorithms', author: 'Nicholas Tran'),
  Book(title: 'OSTEP', author: 'Ahmad Ezzat'),
];
