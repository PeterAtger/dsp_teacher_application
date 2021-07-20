List<List<String>> check(List<List<String>> list, int sentencelength) {
  for (var i = 0; i < list.length; i++) {
    if (list[i].length % sentencelength != 0) {
      for (var j = 0; j < list[i].length % sentencelength; j++) {
        list[i].add('-');
      }
    }
  }
  return list;
}

List<List<String>> removepoint(List<List<String>> list) {
  for (var i = 0; i < list.length; i++) {
    list[i].remove('.');
  }
  return list;
}
