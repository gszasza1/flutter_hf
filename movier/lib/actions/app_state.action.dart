
import 'package:flutter/material.dart';

class AppstateAction {

	@override
	String toString() {
	return 'AppstateAction { }';
	}
}

class AppstateSuccessAction {
	final int isSuccess;

	AppstateSuccessAction({required this.isSuccess});
	@override
	String toString() {
	return 'AppstateSuccessAction { isSuccess: $isSuccess }';
	}
}

class AppstateFailedAction {
	final String error;

	AppstateFailedAction({required this.error});

	@override
	String toString() {
	return 'AppstateFailedAction { error: $error }';
	}
}
	