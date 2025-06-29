enum BoxType {
  account('accountBox'),
  funds('fundsBox'),
  transaction('transactionBox');

  const BoxType(this.type);

  final String type;
}
