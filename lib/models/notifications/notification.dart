class Author {
  late String id;
  late String username;
  late String fullName;
  late String email;
  //late String? avatar;

  Author.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? "";
    username = json['username'] ?? "";
    fullName = json['fullName'] ?? "";
    email = json['email'] ?? "";
    // avatar = json['avatar'] ?? "";
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'fullName': fullName,
        'email': email,
      };
}

class Object {
  Object({
    required this.id,
    required this.bloodRequest,
    required this.requestId,
  });

  String id;
  String bloodRequest;
  String requestId;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        id: json["id"] ?? "",
        bloodRequest: json["bloodRequest"] ?? "",
        requestId: json["requestId"] ?? "",
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "bloodRequest": bloodRequest, "requestId": requestId};
}

abstract class Notification {
  final String id;
  final bool isRemind;
  final List<String> userRead;
  final bool isRead;
  final String type;
  final String title;
  final String description;
  final Author author;
  final String? relateUser;
  final Object object;
  final DateTime notiDate;
  final List<dynamic> documentList;
  final List<dynamic> imageVideoList;

  Notification({
    required this.id,
    required this.isRemind,
    required this.userRead,
    required this.isRead,
    required this.type,
    required this.title,
    required this.description,
    required this.author,
    required this.relateUser,
    required this.object,
    required this.notiDate,
    required this.documentList,
    required this.imageVideoList,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'suitableBlood':
        return SuitableBloodNotification.fromJson(json);
      case 'verify':
        return VerifyNotification.fromJson(json);
      case 'calendar':
        return CalendarNotification.fromJson(json);
      case 'transaction':
        return TransactionNotification.fromJson(json);
      case 'message':
        return MessageNotification.fromJson(json);
      case 'notiSystem':
        return NotiSystemNotification.fromJson(json);
      case 'confirmBlood':
        return ConfirmBloodNotification.fromJson(json);
      case 'receiveBlood':
        return ReceiveBloodNotification.fromJson(json);
      default:
        throw Exception('Invalid Notification Type:${json['type']}');
    }
  }
  Map<String, dynamic> toJson() => {
        '_id': id,
        'isRemind': isRemind,
        'userRead': userRead,
        'isRead': isRead,
        'type': type,
        'title': title,
        'description': description,
        'author': author.toJson(),
        'relateUser': relateUser,
        'object': object,
        'notiDate': notiDate.toIso8601String(),
        'documentList': documentList,
        'imageVideoList': imageVideoList,
      };
}

class SuitableBloodNotification extends Notification {
  SuitableBloodNotification({
    required String id,
    required bool isRemind,
    required List<String> userRead,
    required bool isRead,
    required String type,
    required String title,
    required String description,
    required Author author,
    required String? relateUser,
    required Object object,
    required DateTime notiDate,
    required DateTime createdAt,
    required List<dynamic> documentList,
    required List<dynamic> imageVideoList,
  }) : super(
          id: id,
          isRemind: isRemind,
          userRead: userRead,
          isRead: isRead,
          type: type,
          title: title,
          description: description,
          author: author,
          relateUser: relateUser,
          object: object,
          notiDate: notiDate,
          documentList: documentList,
          imageVideoList: imageVideoList,
        );

  factory SuitableBloodNotification.fromJson(Map<String, dynamic> json) {
    return SuitableBloodNotification(
      id: json['_id'],
      isRemind: json['isRemind'],
      userRead: List<String>.from(json['userRead']),
      isRead: json['isRead'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      author: Author.fromJson(json['author'] ?? {}),
      relateUser: json['relateUser'] ?? "",
      object: Object.fromJson(json['object']),
      notiDate: DateTime.parse(json['notiDate']),
      createdAt: DateTime.parse(json['createdAt']),
      documentList: List<dynamic>.from(json['documentList']),
      imageVideoList: List<dynamic>.from(json['imageVideoList']),
    );
  }
}

class VerifyNotification extends Notification {
  VerifyNotification({
    required String id,
    required bool isRemind,
    required List<String> userRead,
    required bool isRead,
    required String type,
    required String title,
    required String description,
    required Author author,
    required String? relateUser,
    required Object object,
    required DateTime notiDate,
    required List<dynamic> documentList,
    required List<dynamic> imageVideoList,
  }) : super(
          id: id,
          isRemind: isRemind,
          userRead: userRead,
          isRead: isRead,
          type: type,
          title: title,
          description: description,
          author: author,
          relateUser: relateUser,
          object: object,
          notiDate: notiDate,
          documentList: documentList,
          imageVideoList: imageVideoList,
        );

  factory VerifyNotification.fromJson(Map<String, dynamic> json) {
    return VerifyNotification(
      id: json['_id'],
      isRemind: json['isRemind'],
      userRead: List<String>.from(json['userRead']),
      isRead: json['isRead'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      author: Author.fromJson(json['author']),
      relateUser: json['relateUser'] ?? "",
      object: Object.fromJson(json['object']),
      notiDate: DateTime.parse(json['notiDate']),
      documentList: List<dynamic>.from(json['documentList']),
      imageVideoList: List<dynamic>.from(json['imageVideoList']),
    );
  }
}

class CalendarNotification extends Notification {
  CalendarNotification({
    required String id,
    required bool isRemind,
    required List<String> userRead,
    required bool isRead,
    required String type,
    required String title,
    required String description,
    required Author author,
    required String? relateUser,
    required Object object,
    required DateTime notiDate,
    required List<dynamic> documentList,
    required List<dynamic> imageVideoList,
  }) : super(
          id: id,
          isRemind: isRemind,
          userRead: userRead,
          isRead: isRead,
          type: type,
          title: title,
          description: description,
          author: author,
          relateUser: relateUser,
          object: object,
          notiDate: notiDate,
          documentList: documentList,
          imageVideoList: imageVideoList,
        );

  factory CalendarNotification.fromJson(Map<String, dynamic> json) {
    return CalendarNotification(
      id: json['_id'],
      isRemind: json['isRemind'],
      userRead: List<String>.from(json['userRead']),
      isRead: json['isRead'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      author: Author.fromJson(json['author']),
      relateUser: json['relateUser'] ?? "",
      object: Object.fromJson(json['object']),
      notiDate: DateTime.parse(json['notiDate']),
      documentList: List<dynamic>.from(json['documentList']),
      imageVideoList: List<dynamic>.from(json['imageVideoList']),
    );
  }
}

class TransactionNotification extends Notification {
  TransactionNotification({
    required String id,
    required bool isRemind,
    required List<String> userRead,
    required bool isRead,
    required String type,
    required String title,
    required String description,
    required Author author,
    required String? relateUser,
    required Object object,
    required DateTime notiDate,
    required List<dynamic> documentList,
    required List<dynamic> imageVideoList,
  }) : super(
          id: id,
          isRemind: isRemind,
          userRead: userRead,
          isRead: isRead,
          type: type,
          title: title,
          description: description,
          author: author,
          relateUser: relateUser,
          object: object,
          notiDate: notiDate,
          documentList: documentList,
          imageVideoList: imageVideoList,
        );

  factory TransactionNotification.fromJson(Map<String, dynamic> json) {
    return TransactionNotification(
      id: json['_id'],
      isRemind: json['isRemind'],
      userRead: List<String>.from(json['userRead']),
      isRead: json['isRead'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      author: Author.fromJson(json['author']),
      relateUser: json['relateUser'] ?? "",
      object: Object.fromJson(json['object']),
      notiDate: DateTime.parse(json['notiDate']),
      documentList: List<dynamic>.from(json['documentList']),
      imageVideoList: List<dynamic>.from(json['imageVideoList']),
    );
  }
}

class MessageNotification extends Notification {
  MessageNotification({
    required String id,
    required bool isRemind,
    required List<String> userRead,
    required bool isRead,
    required String type,
    required String title,
    required String description,
    required Author author,
    required String? relateUser,
    required Object object,
    required DateTime notiDate,
    required List<dynamic> documentList,
    required List<dynamic> imageVideoList,
  }) : super(
          id: id,
          isRemind: isRemind,
          userRead: userRead,
          isRead: isRead,
          type: type,
          title: title,
          description: description,
          author: author,
          relateUser: relateUser,
          object: object,
          notiDate: notiDate,
          documentList: documentList,
          imageVideoList: imageVideoList,
        );

  factory MessageNotification.fromJson(Map<String, dynamic> json) {
    return MessageNotification(
      id: json['_id'],
      isRemind: json['isRemind'],
      userRead: List<String>.from(json['userRead']),
      isRead: json['isRead'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      author: Author.fromJson(json['author']),
      relateUser: json['relateUser'] ?? "",
      object: Object.fromJson(json['object']),
      notiDate: DateTime.parse(json['notiDate']),
      documentList: List<dynamic>.from(json['documentList']),
      imageVideoList: List<dynamic>.from(json['imageVideoList']),
    );
  }
}

class NotiSystemNotification extends Notification {
  NotiSystemNotification({
    required String id,
    required bool isRemind,
    required List<String> userRead,
    required bool isRead,
    required String type,
    required String title,
    required String description,
    required Author author,
    required String? relateUser,
    required Object object,
    required DateTime notiDate,
    required List<dynamic> documentList,
    required List<dynamic> imageVideoList,
  }) : super(
          id: id,
          isRemind: isRemind,
          userRead: userRead,
          isRead: isRead,
          type: type,
          title: title,
          description: description,
          author: author,
          relateUser: relateUser,
          object: object,
          notiDate: notiDate,
          documentList: documentList,
          imageVideoList: imageVideoList,
        );

  factory NotiSystemNotification.fromJson(Map<String, dynamic> json) {
    return NotiSystemNotification(
      id: json['_id'],
      isRemind: json['isRemind'],
      userRead: List<String>.from(json['userRead']),
      isRead: json['isRead'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      author: Author.fromJson(json['author']),
      relateUser: json['relateUser'] ?? "",
      object: Object.fromJson(json['object']),
      notiDate: DateTime.parse(json['notiDate']),
      documentList: List<dynamic>.from(json['documentList']),
      imageVideoList: List<dynamic>.from(json['imageVideoList']),
    );
  }
}

class ReceiveBloodNotification extends Notification {
  ReceiveBloodNotification({
    required String id,
    required bool isRemind,
    required List<String> userRead,
    required bool isRead,
    required String type,
    required String title,
    required String description,
    required Author author,
    required String? relateUser,
    required Object object,
    required DateTime notiDate,
    required List<dynamic> documentList,
    required List<dynamic> imageVideoList,
  }) : super(
          id: id,
          isRemind: isRemind,
          userRead: userRead,
          isRead: isRead,
          type: type,
          title: title,
          description: description,
          author: author,
          relateUser: relateUser,
          object: object,
          notiDate: notiDate,
          documentList: documentList,
          imageVideoList: imageVideoList,
        );

  factory ReceiveBloodNotification.fromJson(Map<String, dynamic> json) {
    return ReceiveBloodNotification(
      id: json['_id'],
      isRemind: json['isRemind'],
      userRead: List<String>.from(json['userRead']),
      isRead: json['isRead'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      author: Author.fromJson(json['author']),
      relateUser: json['relateUser'] ?? "",
      object: Object.fromJson(json['object']),
      notiDate: DateTime.parse(json['notiDate']),
      documentList: List<dynamic>.from(json['documentList']),
      imageVideoList: List<dynamic>.from(json['imageVideoList']),
    );
  }
}

class ConfirmBloodNotification extends Notification {
  ConfirmBloodNotification({
    required String id,
    required bool isRemind,
    required List<String> userRead,
    required bool isRead,
    required String type,
    required String title,
    required String description,
    required Author author,
    required String? relateUser,
    required Object object,
    required DateTime notiDate,
    required List<dynamic> documentList,
    required List<dynamic> imageVideoList,
  }) : super(
          id: id,
          isRemind: isRemind,
          userRead: userRead,
          isRead: isRead,
          type: type,
          title: title,
          description: description,
          author: author,
          relateUser: relateUser,
          object: object,
          notiDate: notiDate,
          documentList: documentList,
          imageVideoList: imageVideoList,
        );

  factory ConfirmBloodNotification.fromJson(Map<String, dynamic> json) {
    return ConfirmBloodNotification(
      id: json['_id'],
      isRemind: json['isRemind'],
      userRead: List<String>.from(json['userRead']),
      isRead: json['isRead'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      author: Author.fromJson(json['author']),
      relateUser: json['relateUser'] ?? "",
      object: Object.fromJson(json['object']),
      notiDate: DateTime.parse(json['notiDate']),
      documentList: List<dynamic>.from(json['documentList']),
      imageVideoList: List<dynamic>.from(json['imageVideoList']),
    );
  }
}
