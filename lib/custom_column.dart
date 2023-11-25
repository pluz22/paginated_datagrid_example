import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

GridColumn customColumn({
  required String columnName,
  required String label,
  Alignment alignment = Alignment.centerLeft,
  ColumnWidthMode columnWidthMode = ColumnWidthMode.none,
}) {
  return GridColumn(
    columnName: columnName,
    columnWidthMode: columnWidthMode,
    label: Container(
      alignment: alignment,
      padding: const EdgeInsets.all(8),
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
      ),
    ),
  );
}
