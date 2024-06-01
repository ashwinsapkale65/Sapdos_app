import 'package:bloc/bloc.dart';

enum CustomExpansionTileState { collapsed, expanded }

class CustomExpansionTileBloc
    extends Cubit<CustomExpansionTileState> {
  CustomExpansionTileBloc() : super(CustomExpansionTileState.collapsed);

  void toggleState() {
    emit(state == CustomExpansionTileState.collapsed
        ? CustomExpansionTileState.expanded
        : CustomExpansionTileState.collapsed);
  }
}
