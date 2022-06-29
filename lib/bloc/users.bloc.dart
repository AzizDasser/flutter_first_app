import 'package:bloc/bloc.dart';
import 'package:first_app/model/users.model.dart';
import 'package:first_app/repository/users.repository.dart';

abstract class UsersEvent{}

class SearchUsersEvent extends UsersEvent{
  final String keyword;
  final int page;
  final int pageSize;
   SearchUsersEvent({
    required this.keyword,
     required this.page,
     required this.pageSize,
});
}
class NextPageEvent extends SearchUsersEvent{
  NextPageEvent({required super.keyword, required super.page, required super.pageSize});



}
abstract class UsersState{
  final List<User> users;
  final int currentPage;
  final int totalPages;
  final int pageSize;
  final String currentKeyword;

  UsersState({required this.users, required  this.currentPage, required this.totalPages, required this.pageSize,
      required this.currentKeyword}) ;
}
class SearchUsersSuccessState extends UsersState{
  SearchUsersSuccessState({required List<User> users, required int currentPage, required int totalPages, required int pageSize, required String currentKeyword}) : super(users: users, currentPage: currentPage, totalPages: totalPages, pageSize: pageSize, currentKeyword: currentKeyword);

}
class SearchUsersLoadingState extends UsersState{
  SearchUsersLoadingState({required super.users, required super.currentPage, required super.totalPages, required super.pageSize, required super.currentKeyword});
}
class SearchUsersErrorState extends UsersState{
  final String errorMessage;

  SearchUsersErrorState({required super.users, required super.currentPage, required super.totalPages, required super.pageSize, required super.currentKeyword,required this.errorMessage});



}

class UserInitialState extends UsersState{
  UserInitialState() : super(users: [], currentPage: 0, totalPages: 0, pageSize: 0, currentKeyword: '');

}

class UsersBloc extends Bloc<UsersEvent, UsersState>{
  UsersRepository usersRepository=UsersRepository();
  late UsersEvent currentEvent;
  UsersBloc(): super(UserInitialState()){
    on((SearchUsersEvent event, emit) async {
      currentEvent=event;
     emit(SearchUsersLoadingState(
       currentKeyword: state.currentKeyword,
       pageSize: state.pageSize,
       totalPages: state.totalPages,
       currentPage: state.currentPage,
       users: state.users,
     ));

     try {
       ListUsers listUsers = await usersRepository.searchUsers(event.keyword, event.page, event.pageSize);
        int totalPage=(listUsers.totalCount/event.pageSize).floor();
        if(listUsers.totalCount % event.pageSize !=0){totalPage=totalPage+1;}
       emit(SearchUsersSuccessState(
           users: listUsers.items,
           currentPage: event.page,
           totalPages: totalPage,
           pageSize: event.pageSize,
           currentKeyword: event.keyword,
       ) );
     } catch (e) {
       emit(SearchUsersErrorState(
           currentKeyword: state.currentKeyword,
           pageSize: state.pageSize,
           totalPages: state.totalPages,
           currentPage: state.currentPage,
           users: state.users,

           errorMessage: e.toString()) );
     }
    });

    on((NextPageEvent event, emit) async {
      currentEvent=event;
     print("Next Page${event.page}");

      try {
        ListUsers listUsers = await usersRepository.searchUsers(event.keyword, event.page, event.pageSize);
        int totalPage=(listUsers.totalCount/event.pageSize).floor();
        if(listUsers.totalCount % event.pageSize !=0){totalPage=totalPage+1;}
        List<User> currentList=[...state.users];
        currentList.addAll(listUsers.items);

        emit(SearchUsersSuccessState(
          users: currentList,
          currentPage: event.page,
          totalPages: totalPage,
          pageSize: event.pageSize,
          currentKeyword: event.keyword,
        ) );
      } catch (e) {
        emit(SearchUsersErrorState(
            currentKeyword: state.currentKeyword,
            pageSize: state.pageSize,
            totalPages: state.totalPages,
            currentPage: state.currentPage,
            users: state.users,
            errorMessage: e.toString()) );
      }
    });



  }


}