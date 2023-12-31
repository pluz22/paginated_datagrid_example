import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paginated_datagrid_example/custom_column.dart';
import 'package:paginated_datagrid_example/people.dart';
import 'package:paginated_datagrid_example/people_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paginated DataGrid Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Paginated DataGrid Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PeopleDataSource peopleDataSource = PeopleDataSource();

  double pageCount = 1.0;
  int rowsPerPage = 10;

  double calculatePageCount() {
    return (peopleDataSource.rows.length / rowsPerPage).ceilToDouble();
  }

  void updateRows() {
    rootBundle.loadString("assets/people.json").then(
      (response) {
        final List<dynamic> data = json.decode(response);
        peopleDataSource.updateData(
          data
              .map(
                (p) => People.fromJson(p),
              )
              .toList(),
        );
        pageCount = calculatePageCount();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfDataGrid(
              columnWidthMode: ColumnWidthMode.fill,
              source: peopleDataSource,
              rowsPerPage: rowsPerPage,
              shrinkWrapRows: false,
              columns: [
                customColumn(
                  columnName: "id",
                  label: "Id",
                  columnWidthMode: ColumnWidthMode.fitByCellValue,
                ),
                customColumn(
                  columnName: "name",
                  label: "Name",
                ),
                customColumn(
                  columnName: "email",
                  label: "E-mail",
                ),
                customColumn(
                  columnName: "city",
                  label: "City",
                ),
                customColumn(
                  columnName: "mac",
                  label: "MAC Address",
                ),
                customColumn(
                  columnName: "timestamp",
                  label: "Timestamp",
                ),
                customColumn(
                  columnName: "creditcard",
                  label: "Credit Card",
                ),
              ],
            ),
          ),
          SfDataPager(
            availableRowsPerPage: const [10, 25, 50, 100],
            pageCount: pageCount,
            delegate: peopleDataSource,
            onPageNavigationStart: (int pageIndex) {
                updateRows();
            },
            onRowsPerPageChanged: (int? rows) {
              rowsPerPage = rows ?? 10;
              updateRows();
            }
          ),
        ],
      ),
    );
  }
}
