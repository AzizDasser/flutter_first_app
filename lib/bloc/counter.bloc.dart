// Actions
import 'package:bloc/bloc.dart';

abstract class CounterEvent {}
class IncrementCounterEvent extends CounterEvent{

}
class DecrementCounterEvent extends CounterEvent{

}

// State

abstract class CounterState {
  final int counter;
  const CounterState({
    required this.counter,
});
}
class CounterSuccessState extends CounterState {
  CounterSuccessState({required super.counter});

}
class CounterErrorState extends CounterState{
  final String errorMessage;

  CounterErrorState({required this.errorMessage, required counter}) : super(counter: counter);

}

class CounterInitialState extends CounterState {
  CounterInitialState() : super(counter:0);

}
// Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState>{


  CounterBloc() : super(CounterInitialState()){


    int counterValue;
    on((IncrementCounterEvent event, emit)=> {
      if(state.counter<10){
         counterValue = state.counter+1,
         emit(CounterSuccessState(counter : counterValue))

      } else {
    emit(CounterErrorState(
    counter : state.counter,
    errorMessage : "Counter value can't exceed 10",

    ))
    }
    });

    on((DecrementCounterEvent event, emit)=> {
      if(state.counter>0){
        counterValue = state.counter-1,
        emit(CounterSuccessState(counter : counterValue))

      } else {
        emit(CounterErrorState(
          counter : state.counter,
          errorMessage : "Counter value can't be less than 0",

        ))
      }
    });
  }


}