import 'package:first_app/bloc/counter.bloc.dart';
import 'package:first_app/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/main.drawer.widget.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: const Text("Counter Bloc"),),
      body: Center(
        child: BlocBuilder<CounterBloc,CounterState>(
        builder: (context,state){
         if( state is CounterSuccessState || state is CounterInitialState){

           return Text(
               "Counter value => ${state.counter}",
               style: Theme.of(context).textTheme.headline5,

           );
         }else if (state is CounterErrorState){
           return Column(
             mainAxisAlignment: MainAxisAlignment.center,

             children: [
                 Text(
                   "Counter value => ${state.counter}",
                    style: Theme.of(context).textTheme.headline5,

                     ),
               Text(
                 state.errorMessage,
                 style: CustomThemes.errorTextStyle,

               ),
             ],
           );

         }
         else {
           return Container();
         }
        },
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          FloatingActionButton(
            heroTag: "dec",
            onPressed: (){
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            heroTag: "inc",
            onPressed: (){
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
      
    );




  }
}