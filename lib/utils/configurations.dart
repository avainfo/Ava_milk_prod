import 'package:ava_milk_prod/components/inputs/selector.dart';
import 'package:flutter/cupertino.dart';

import '../components/inputs/incrementer.dart';
import '../components/inputs/text_input.dart';

class Configurations {
  static const List<Map<String, StatefulWidget>> SEEDING_CONFIGURATIONS = [
    {
      "Acid Lait (pH)": Incrementer(),
      "Acid Serum (pH)": Incrementer(),
      "Qualité du caille": Selector(
        buttons: [
          "Beau",
          "Mou",
          "Troué",
          "Rétracté",
          "Correct",
          "Fissure",
          "Gonflé",
          "Platisque",
        ],
      ),
    },
    {
      "Nb louches": Incrementer(),
      "Lot": TextInput(),
      "Omega": Incrementer(),
      "Sigma": Incrementer(),
      "Temp (°C)": Incrementer(),
    },
    {
      "Litrage tomme": Incrementer(),
      "Nb de tommes": Incrementer(),
      "Litrage yaourt": Incrementer(),
      "Nb de pots": Incrementer(),
    }
  ];

  static const List<Map<String, StatefulWidget>> MANUFACTURING_CONFIGURATIONS = [
    {
      "Acid Lait (pH)": Incrementer(),
      "Acid Serum (pH)": Incrementer(),
      "Qualité du caille": Selector(
        buttons: [
          "Beau",
          "Mou",
          "Troué",
          "Rétracté",
          "Correct",
          "Fissure",
          "Gonflé",
          "Platisque",
        ],
      ),
    },
    {
      "Nb louches": Incrementer(),
      "Lot": TextInput(),
      "Omega": Incrementer(),
      "Sigma": Incrementer(),
      "Temp (°C)": Incrementer(),
    },
    {
      "Litrage tomme": Incrementer(),
      "Nb de tommes": Incrementer(),
      "Litrage yaourt": Incrementer(),
      "Nb de pots": Incrementer(),
    }
  ];
}
