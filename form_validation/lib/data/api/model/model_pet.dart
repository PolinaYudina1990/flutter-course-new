class PetData {
  final String name;
  final DateTime dateBirth;
  final int weight;
  final String emeil;
  final List<Vaccine> vaccines;

  PetData(this.name, this.dateBirth, this.weight, this.emeil, this.vaccines);
}

enum Vaccine {
  rabies('бешенство'),
  kovid('ковид'),
  malaria('малярия');

  const Vaccine(this.value);
  final String value;
}
