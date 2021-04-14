import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'text_state.dart';

class TextCubit extends Cubit<TextState> {
  TextCubit() : super(TextInitial());

  bool isTextEmpty = true;

  TextEditingController textController = TextEditingController();
  FocusNode textFocusNode = FocusNode();

  @override
  Future<void> close() {
    textController.dispose();
    textFocusNode.dispose();
    return super.close();
  }

  void textInputNotEmpty() {
    if (isTextEmpty == true) {
      isTextEmpty = false;
      emit(TextNotEmpty());
    }
  }

  void textInputEmpty() {
    if (isTextEmpty == false) {
      isTextEmpty = true;
      emit(TextInitial());
    }
  }

  void removeFocus() {
    textFocusNode.unfocus();
  }
}
