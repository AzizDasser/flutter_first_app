import 'package:first_app/model/users.model.dart';

class SearchUserResponse {
  int totalCount;
  List<User> items;
  SearchUserResponse(this.totalCount, this.items);

  SearchUserResponse.fromJson(Map<String,dynamic> json) :
        totalCount = json['total_count'],
        items = (json['items'] as List).map((e) =>
            User.fromJson(e)).toList();
}