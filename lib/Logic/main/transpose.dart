import 'package:flutter/material.dart';

List<List> transpose(List<List> colsInRows) {
  int nRows = colsInRows.length;
  int nCols = colsInRows[0].length;
  List<List<Widget>> rowsInCols = [];
  List<Widget> temp = [];

  // Transpose
  for (int col = 0; col < nCols; col++) {
    for (int row = 0; row < nRows; row++) {
      temp.add(colsInRows[row][col]);
    }
    rowsInCols.add(temp);
    temp = [];
  }
  return rowsInCols;
}
