extension SumList on List<num> {
  num get sum {
    num result = 0;
    for (num e in this) {
      result += e;
    }

    return result;
  }
}
