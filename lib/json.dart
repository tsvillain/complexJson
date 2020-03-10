class Product {
  final List<Result> results;
  Product({this.results});
  factory Product.fromJson(Map<String, dynamic> data) {
    var list = data['data']['result'] as List;
    List<Result> resultList = list.map((e) => Result.fromJson(e)).toList();
    return Product(
      results: resultList,
    );
  }
}

class Result {
  final String borrowDate;
  final List<UserInfo> userInfos;
  final List<BookData> bookDatas;

  Result({this.borrowDate, this.userInfos, this.bookDatas});

  factory Result.fromJson(Map<String, dynamic> result) {
    var list1 = result['userInfo'] as List;
    List<UserInfo> userList = list1.map((e) => UserInfo.fromJson(e)).toList();
    var list2 = result['bookData'] as List;
    List<BookData> bookList = list2.map((e) => BookData.fromJson(e)).toList();

    return Result(
      borrowDate: result['borrowDate'],
      userInfos: userList,
      bookDatas: bookList,
    );
  }
}

class UserInfo {
  final String userType;
  final String name;
  final String email;
  final String branch;
  final String semester;
  final int enrollmentNo;
  final int income;

  UserInfo(
      {this.userType,
      this.name,
      this.email,
      this.branch,
      this.semester,
      this.enrollmentNo,
      this.income});

  factory UserInfo.fromJson(Map<String, dynamic> data) {
    return UserInfo(
      userType: data['userType'],
      name: data['name'],
      email: data['email'],
      branch: data['branch'],
      semester: data['semester'],
      enrollmentNo: data['enrollmentNo'],
      income: data['income'],
    );
  }
}

class BookData {
  final String uploadDate;
  final String subject;
  final String department;
  final String bookName;
  final String author;
  final String bookType;
  final int doner;
  final String bookImage;

  BookData({
    this.uploadDate,
    this.subject,
    this.department,
    this.bookName,
    this.author,
    this.bookType,
    this.doner,
    this.bookImage,
  });

  factory BookData.fromJson(Map<String, dynamic> data) {
    return BookData(
      uploadDate: data['uploadDate'],
      subject: data['subject'],
      department: data['department'],
      bookName: data['bookName'],
      author: data['author'],
      bookType: data['bookType'],
      doner: data['doner'],
      bookImage: data['bookImage'],
    );
  }
}
