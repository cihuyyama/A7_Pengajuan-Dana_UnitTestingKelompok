

class MockList extends Mock implements ListModel {}

void main(){
  group("ListModel", () {
    test("should create a valid list model from a map", () {
      // arrange
      final map = {
        'id': '1',
        'namak': 'HUT KMTI ke-17',
        'tgl': '17 September 2023',
        'desk': 'HUT KMTI ke-17',
        'dana': '3.000.000',
        'status': 'Menunggu',
        'pdf': 'Proposal.pdf',
      };
      // act
      final result = ListModel.fromMap(map);
      // assert
      expect(result, isA<ListModel>());
      expect(result.id, map['id']);
      expect(result.namak, map['namak']);
      expect(result.tgl, map['tgl']);
      expect(result.desk, map['desk']);
      expect(result.dana, map['dana']);
      expect(result.status, map['status']);
      expect(result.pdf, map['pdf']);
    });

    test("should convert a list model to map", () {
      // arrange
      final list = ListModel(
        id: '1',
        namak: "HUT KMTI ke-17", 
        tgl: "17 September 2023",
        desk: "HUT KMTI ke-17", 
        dana: "3.000.000",
        status: "Menunggu",
        pdf: "Proposal.pdf"
      );
      // act
      final result = list.toMap();
      // assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['id'], list.id);
      expect(result['namak'], list.namak);
      expect(result['tgl'], list.tgl);
      expect(result['desk'], list.desk);
      expect(result['dana'], list.dana);
      expect(result['status'], list.status);
      expect(result['pdf'], list.pdf);
    });

    test("toJson should result a json string representation of the list model", () {
      // arrange
      final list = ListModel(
        id: '1',
        namak: "HUT KMTI ke-17", 
        tgl: "17 September 2023",
        desk: "HUT KMTI ke-17", 
        dana: "3.000.000",
        status: "Menunggu",
        pdf: "Proposal.pdf"
      );
      // act
      final result = list.toJson();
      // assert
      expect(result, isA<String>());
      expect(result, '{"id":"1","namak":"HUT KMTI ke-17","tgl":"17 September 2023","desk":"HUT KMTI ke-17","dana":"3.000.000","status":"Menunggu","pdf":"Proposal.pdf"}');
    });

    test("fromJson should return a contact model from a json string", () {
      // arrange
      final list = '{"id":"1","namak":"HUT KMTI ke-17","tgl":"17 September 2023","desk":"HUT KMTI ke-17","dana":"3.000.000","status":"Menunggu","pdf":"Proposal.pdf"}';
      // act
      final result = ListModel.fromJson(list);
      // assert
      expect(result, isA<ListModel>());
      expect(result.id, '1');
      expect(result.namak, 'HUT KMTI ke-17');
      expect(result.tgl, '17 September 2023');
      expect(result.desk, 'HUT KMTI ke-17');
      expect(result.dana, '3.000.000');
      expect(result.status, 'Menunggu');
      expect(result.pdf, 'Proposal.pdf');
    });
  });
}