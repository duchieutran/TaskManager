// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_manage_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataManageStore on DataManageStoreBase, Store {
  late final _$tasklistAtom =
      Atom(name: 'DataManageStoreBase.tasklist', context: context);

  @override
  ObservableList<Task> get tasklist {
    _$tasklistAtom.reportRead();
    return super.tasklist;
  }

  @override
  set tasklist(ObservableList<Task> value) {
    _$tasklistAtom.reportWrite(value, super.tasklist, () {
      super.tasklist = value;
    });
  }

  late final _$mapUserAtom =
      Atom(name: 'DataManageStoreBase.mapUser', context: context);

  @override
  ObservableMap<String, dynamic> get mapUser {
    _$mapUserAtom.reportRead();
    return super.mapUser;
  }

  @override
  set mapUser(ObservableMap<String, dynamic> value) {
    _$mapUserAtom.reportWrite(value, super.mapUser, () {
      super.mapUser = value;
    });
  }

  late final _$titleAtom =
      Atom(name: 'DataManageStoreBase.title', context: context);

  @override
  TextEditingController get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(TextEditingController value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$subtitleAtom =
      Atom(name: 'DataManageStoreBase.subtitle', context: context);

  @override
  TextEditingController get subtitle {
    _$subtitleAtom.reportRead();
    return super.subtitle;
  }

  @override
  set subtitle(TextEditingController value) {
    _$subtitleAtom.reportWrite(value, super.subtitle, () {
      super.subtitle = value;
    });
  }

  late final _$setStatusAsyncAction =
      AsyncAction('DataManageStoreBase.setStatus', context: context);

  @override
  Future<void> setStatus(int index, Task task) {
    return _$setStatusAsyncAction.run(() => super.setStatus(index, task));
  }

  late final _$_infoUserAsyncAction =
      AsyncAction('DataManageStoreBase._infoUser', context: context);

  @override
  Future<bool> _infoUser() {
    return _$_infoUserAsyncAction.run(() => super._infoUser());
  }

  late final _$_getDataAsyncAction =
      AsyncAction('DataManageStoreBase._getData', context: context);

  @override
  Future<bool> _getData() {
    return _$_getDataAsyncAction.run(() => super._getData());
  }

  late final _$_addDataAsyncAction =
      AsyncAction('DataManageStoreBase._addData', context: context);

  @override
  Future<bool> _addData() {
    return _$_addDataAsyncAction.run(() => super._addData());
  }

  late final _$_updateDataAsyncAction =
      AsyncAction('DataManageStoreBase._updateData', context: context);

  @override
  Future<bool> _updateData() {
    return _$_updateDataAsyncAction.run(() => super._updateData());
  }

  late final _$callGetAsyncAction =
      AsyncAction('DataManageStoreBase.callGet', context: context);

  @override
  Future<void> callGet() {
    return _$callGetAsyncAction.run(() => super.callGet());
  }

  late final _$callAddAsyncAction =
      AsyncAction('DataManageStoreBase.callAdd', context: context);

  @override
  Future<void> callAdd() {
    return _$callAddAsyncAction.run(() => super.callAdd());
  }

  late final _$callGetUserAsyncAction =
      AsyncAction('DataManageStoreBase.callGetUser', context: context);

  @override
  Future<void> callGetUser() {
    return _$callGetUserAsyncAction.run(() => super.callGetUser());
  }

  late final _$callUpdateAsyncAction =
      AsyncAction('DataManageStoreBase.callUpdate', context: context);

  @override
  Future<void> callUpdate() {
    return _$callUpdateAsyncAction.run(() => super.callUpdate());
  }

  late final _$DataManageStoreBaseActionController =
      ActionController(name: 'DataManageStoreBase', context: context);

  @override
  void dispose() {
    final _$actionInfo = _$DataManageStoreBaseActionController.startAction(
        name: 'DataManageStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$DataManageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasklist: ${tasklist},
mapUser: ${mapUser},
title: ${title},
subtitle: ${subtitle}
    ''';
  }
}
