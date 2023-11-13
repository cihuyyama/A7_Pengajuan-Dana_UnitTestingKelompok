// can add a new list to the collection and update it
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pengajuan_dana/controller/list_controller.dart';
import 'package:pengajuan_dana/model/list_model.dart';

Future<void> main() async {
  group("List Controller : ", () {
    testWidgets("Test add a new list to the collection",
        (WidgetTester tester) async {
      final ListController listController = ListController();
      final List<DocumentSnapshot> documentsBefore =
          await listController.getList();
      final ListModel listModel = ListModel(
        namak: 'Test Name',
        tgl: '2022-01-01',
        desk: 'Test Description',
        dana: '1000',
      );

      await listController.addList(listModel);

      final List<DocumentSnapshot> documentsAfter =
          await listController.getList();
      expect(documentsBefore.length, documentsAfter.length - 1);
    });

    testWidgets("Test update list", (widgetTester) async {
      final ListController listController = ListController();
      final ListModel listModel = ListModel(
        namak: 'Test Name',
        tgl: '2022-01-01',
        desk: 'Test Description',
        dana: '1000',
      );

      await listController.addList(listModel);

      final List<DocumentSnapshot> documents = await listController.getList();
      final String id = documents[0].id;

      final ListModel updatedListModel = ListModel(
        id: id,
        namak: 'Updated Name',
        tgl: '2022-02-02',
        desk: 'Updated Description',
        dana: '2000',
      );

      await listController.updateList(updatedListModel);

      final List<DocumentSnapshot> updatedDocuments =
          await listController.getList();
      expect(updatedDocuments[0].data(), updatedListModel.toMap());
    });

    testWidgets("Test delete list", (widgetTester) async {
      final ListController listController = ListController();
      final ListModel listModel = ListModel(
        namak: 'Test Name',
        tgl: '2022-01-01',
        desk: 'Test Description',
        dana: '1000',
      );

      await listController.addList(listModel);

      final List<DocumentSnapshot> documents = await listController.getList();
      final String id = documents[0].id;

      await listController.removeList(id);

      final List<DocumentSnapshot> updatedDocuments =
          await listController.getList();
      expect(updatedDocuments.length, documents.length - 1);
    });

    testWidgets("Test add list if null", (widgetTester) async {
      final ListController listController = ListController();
      final List<DocumentSnapshot> documentsBefore =
          await listController.getList();
      final ListModel listModel = ListModel(
        namak: '',
        tgl: '',
        desk: '',
        dana: '',
      );

      expect(() => listController.addList(listModel), throwsA(isA<ArgumentError>()));
    });
  });
}
