# Rocket Fuel

The Earth probe, Surveyor, has become stranded at the edge of the Solar System after encountering some space dust. To accurately calculate its position in space, safely align its nuclear drive, and continue on its journey, you need to determine its fuel requirements.

Fuel required to power a given module is based on its mass. Specifically, to find the fuel required for a module, take its mass, divide by three, round down, and subtract 2.

For example:

For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2.

For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2.

For a mass of 1969, the fuel required is 654.

For a mass of 100756, the fuel required is 33583.

The Fuel Management team for the project needs to know the total fuel requirement. To find it, individually calculate the fuel needed for the mass of each module, then add together all the fuel values.

What is the sum of the fuel requirements for all of the modules on your spacecraft?

Here is the masses of each module on Surveyor.

```js
const moduleMasses = [
    53035,
    84950,
    100012,
    75128,
    96658,
    80583,
    72951,
    131866,
    99675,
    115923,
    65140,
    59430,
    81288,
    53129,
    96172,
    58912,
    138055,
    62920,
    122353,
    59176,
    149310,
    105061,
    58808,
    103111,
    128538,
    61366,
    53480,
    94427,
    121742,
    143966,
    63092,
    92543,
    67136,
    81575,
    131971,
    71040,
    57035,
    114448,
    101314,
    123688,
    137916,
    68612,
    122453,
    98141,
    61137,
    97628
    126791,
    111826,
    50630,
    67829
    126285,
    97331,
    88587,
    64552,
    111221,
    89639
    72177,
    132711,
    51062,
    98061,
    57919,
    57166,
    134565,
    58677,
    62505,
    85253,
    147337,
    84791,
    114516,
    95597,
    139271,
    83561,
    68285,
    100684,
    86803,
    85887,
    74554,
    113749,
    81899,
    107220,
    110959,
    118220,
    52743,
    71651,
    74775,
    106517,
    132133,
    56919,
    129699,
    137357,
    75781,
    59409,
    134589,
    131438,
    101641,
    105503,
    104371,
    145308,
    75777,
    107333,
]
```