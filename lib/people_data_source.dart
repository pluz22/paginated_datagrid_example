import 'package:flutter/material.dart';
import 'package:paginated_datagrid_example/people.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:intl/intl.dart';

class PeopleDataSource extends DataGridSource {
  List<DataGridRow> dataGridRows = [];
  List<People> _people = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (r) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8),
            child: Text(
              r.value.toString(),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  void buildDataGridRows() {
    dataGridRows = _people.map<DataGridRow>(
      (p) {
        return DataGridRow(
          cells: [
            DataGridCell(
              columnName: "id",
              value: p.id ?? "",
            ),
            DataGridCell<String>(
              columnName: "name",
              value: p.name ?? "",
            ),
            DataGridCell<String>(
              columnName: "email",
              value: p.email ?? "",
            ),
            DataGridCell<String>(
              columnName: "city",
              value: p.city ?? "",
            ),
            DataGridCell(
              columnName: "mac",
              value: p.mac ?? "",
            ),
            DataGridCell(
              columnName: "timestamp",
              value: p.timestamp?.isNotEmpty ?? false
                  ? _formatDate(p.timestamp!)
                  : "",
            ),
            DataGridCell(
              columnName: "creditcard",
              value: p.creditCard ?? "",
            ),
          ],
        );
      },
    ).toList();
    notifyListeners();
  }

  void updateData(List<People> people) {
    _people = people;
    buildDataGridRows();
  }

  String _formatDate(String date) {
    return DateFormat("dd/MM/yyyy -0300").format(DateTime.parse(date));
  }
}
