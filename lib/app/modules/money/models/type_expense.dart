enum TypeExpense {
  FIXED,
  EXPECTED,
  VARIED
}

TypeExpense getTypeFromIndex(String index){
  var types = {
    TypeExpense.FIXED.index.toString(): TypeExpense.FIXED,
    TypeExpense.EXPECTED.index.toString(): TypeExpense.EXPECTED,
    TypeExpense.VARIED.index.toString(): TypeExpense.VARIED,
  };

  return types[index];
}

String getIndexFromType(TypeExpense type){
  return type.index.toString();
}