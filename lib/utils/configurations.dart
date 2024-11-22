import 'package:flutter/cupertino.dart';

import '../components/inputs/incrementer.dart';
import '../components/inputs/text_input.dart';

class Configurations {
  static List<Map<String, StatefulWidget>> SEEDING_CONFIGURATIONS = [
    {
      "Nb louches": const Incrementer(),
      "Lot": const TextInput(),
      "Omega": const Incrementer(),
      "Sigma": const Incrementer(),
      "Temp (°C)": const Incrementer(),
    },
    {
      "Litrage tomme": const Incrementer(),
      "Nb de tommes": const Incrementer(),
      "Litrage yaourt": const Incrementer(),
      "Nb de pots": const Incrementer(),
    }
  ];
}
