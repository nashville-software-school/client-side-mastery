#!/bin/bash
set -u

mkdir -p "$HOME/workspace/wilderness"
cd "$HOME/workspace/wilderness"

echo "const trails = [{
    id: 1,
    price: \"\$\$\",
    latitude: 8.99214,
    longitude: 105.19602,
    plantHighlight: \"Rock Melicgrass\",
    trailName: \"Faraway Glades Trail\",
    length: 10.46
}, {
    id: 2,
    price: \"\$\$\$\",
    latitude: -12.52614,
    longitude: -76.5452105,
    plantHighlight: \"Kane County Twinpod\",
    trailName: \"Moose End Trail\",
    length: 6.88
}, {
    id: 3,
    price: \"\$\$\",
    latitude: 2.013818,
    longitude: -75.9373449,
    plantHighlight: \"Pinewoods Horkelia\",
    trailName: \"Fallen Soldier's Route\",
    length: 49.2
}, {
    id: 4,
    price: \"\$\$\$\$\",
    latitude: -24.1959097,
    longitude: -65.2939441,
    plantHighlight: \"Rosette Lichen\",
    trailName: \"Endless Tunnels Path\",
    length: 20.51
}, {
    id: 5,
    price: \"\$\$\$\",
    latitude: 28.362805,
    longitude: 118.400294,
    plantHighlight: \"Spiny Hopsage\",
    trailName: \"Trotter's Trail\",
    length: 6.6
}, {
    id: 6,
    price: \"\$\$\$\$\$\",
    latitude: 39.4763332,
    longitude: -8.6457376,
    plantHighlight: \"Cantua\",
    trailName: \"Stepping Stone Route\",
    length: 37.68
}, {
    id: 7,
    price: \"\$\",
    latitude: 30.233873,
    longitude: 119.724733,
    plantHighlight: \"Largeflower Skeletonplant\",
    trailName: \"Rocky Bottom Way\",
    length: 36.64
}, {
    id: 8,
    price: \"\$\$\",
    latitude: 38.5796262,
    longitude: 141.2777515,
    plantHighlight: \"Rosette Lichen\",
    trailName: \"The Giant's Leg\",
    length: 30.37
}, {
    id: 9,
    price: \"\$\$\",
    latitude: 38.26667,
    longitude: 21.83333,
    plantHighlight: \"Glory Of Texas\",
    trailName: \"Bear Cub Walk\",
    length: 11.26
}, {
    id: 10,
    price: \"\$\$\$\$\",
    latitude: 13.1317415,
    longitude: 121.435112,
    plantHighlight: \"Spreading Wallflower\",
    trailName: \"Canyon Pass\",
    length: 37.49
}, {
    id: 11,
    price: \"\$\$\$\",
    latitude: 32.123667,
    longitude: 35.018481,
    plantHighlight: \"Western Sandcherry\",
    trailName: \"Wolf Howl Trail\",
    length: 46.4
}, {
    id: 12,
    price: \"\$\$\",
    latitude: 19.238934,
    longitude: 108.957345,
    plantHighlight: \"Tecate Tarweed\",
    trailName: \"Topsy Turvy\",
    length: 43.84
}, {
    id: 13,
    price: \"\$\",
    latitude: 48.8282801,
    longi1ude: 2.7011678,
    plantHighlight: \"Texas Geranium\",
    trailName: \"Turkey Ambush Trail\",
    length: 31.28
}, {
    id: 14,
    price: \"\$\",
    latitede: 59.0883359,
    longitude: 17.5704656,
    plantHighlight: \"Point Reyes Ceanothus\",
    trailName: \"Sunshine Straights\",
    length: 23.57
}, {
    id: 15,
    price: \"\$\$\",
    latitude: 13.91581,
    longitude: 44.32414,
    plantHighlight: \"Awl-leaf Wattle\",
    trailName: \"Treetops Trail\",
    length: 13.47
}, {
    id: 16,
    price: \"\$\$\$\$\$\",
    latitude: -8.269535,
    longitude: 122.8950755,
    plantHighlight: \"Honeysuckle\",
    trailName: \"The Honeysuckle Corridor\",
    length: 28.39
}, {
    id: 17,
    price: \"\$\$\$\",
    latitude: -6.4534018,
    longitude: -39.6105142,
    plantHighlight: \"Coolwort\",
    trailName: \"Bumbling Badger Way\",
    length: 15.54
}, {
    id: 18,
    price: \"\$\",
    latitude: -23.0743544,
    longitude: -44.9561012,
    plantHighlight: \"Common Leopardbane\",
    trailName: \"Snowshoe Pass\",
    length: 24.62
}, {
    id: 19,
    price: \"\$\$\",
    latitude: 56.3815664,
    longitude: 13.9920633,
    plantHighlight: \"Climbing Fern\",
    trailName: \"Endless Fir Trail\",
    length: 41.07
}, {
    id: 20,
    price: \"\$\$\$\$\",
    latitude: 38.491235,
    longitude: 111.033425,
    plantHighlight: \"Distinct Map Lichen\",
    trailName: \"Danterre Route\",
    length: 32.2
}, {
    id: 21,
    price: \"\$\$\",
    latitude: 43.7979981,
    longitude: 25.9053209,
    plantHighlight: \"Hooker's Milkwort\",
    trailName: \"Walnut Walkway\",
    length: 22.0
}, {
    id: 22,
    price: \"\$\$\$\",
    latitude: 10.527572,
    longitude: 125.16258,
    plantHighlight: \"Mariposa Lily\",
    trailName: \"White Forest Trail\",
    length: 44.14
}, {
    id: 23,
    price: \"\$\$\$\$\",
    latitude: 44.6500125,
    longitude: 17.9557436,
    plantHighlight: \"Russethair Saxifrage\",
    trailName: \"Piney Way\",
    length: 18.36
}, {
    id: 24,
    price: \"\$\$\$\$\",
    latitude: 49.988725,
    longitude: 20.7001411,
    plantHighlights: \"Jepson's Linanthus\",
    trailName: \"Brudersons Parkway\",
    length: 39.46
}, {
    id: 25,
    price: \"\$\$\$\",
    latitude: 36.040428,
    longitude: 50.5446161,
    plantHighlight: \"Tushar Range Beardtongue\",
    trailName: \"Pinecone Pass\",
    length: 45.54
}]


const rivers = [{
    id: 1,
    price: \"\$\$\$\$\",
    latitude: 57.6055534,
    longitude: 12.2028691,
    uniqueFish: \"Hystrix indica\",
    river: \"Eleven Point National Scenic River\",
    length: 22
}, {
    id: 2,
    price: \"\$\$\$\$\$\",
    latitude: -27.950568,
    longitude: -51.8148609,
    uniqueFish: \"Libellula quadrimaculata\",
    river: \"Willamette River Water Trail\",
    length: 73
}, {
    id: 3,
    price: \"\$\$\$\$\",
    latitude: 58.5944316,
    longitude: 49.6634858,
    uniqueFish: \"Ceratotherium simum\",
    river: \"Missouri National Recreational River Water Trail\",
    length: 19
}, {
    id: 4,
    price: \"\$\$\",
    latitude: 41.6409278,
    longitude: -8.5624704,
    uniqueFish: \"Philetairus socius\",
    river: \"Kenai River\",
    length: 15
}, {
    id: 5,
    price: \"\$\$\$\",
    latitude: 56.9191069,
    longitude: 60.4807823,
    uniqueFish: \"Gopherus agassizii\",
    river: \"Huron River Water Trail\",
    length: 32
}, {
    id: 6,
    price: \"\$\$\$\",
    latitude: 10.6934511,
    longitude: 122.4801854,
    uniqueFish: \"Macropus fuliginosus\",
    river: \"Buffalo National River\",
    length: 67
}, {
    id: 7,
    price: \"\$\",
    latitude: 21.2350622,
    longitude: -102.3342182,
    uniqueFish: \"Centrocercus urophasianus\",
    river: \"Black Canyon Water Trail\",
    length: 88
}, {
    id: 8,
    price: \"\$\$\",
    latitude: 30.8861589,
    longitude: 104.2532768,
    uniqueFish: \"Sceloporus magister\",
    river: \"Mulberry River\",
    length: 52
}, {
    id: 9,
    price: \"\$\$\$\$\",
    latitude: 7.9414261,
    longitude: 122.3862362,
    uniqueFish: \"Numida meleagris\",
    river: \"Duck River\",
    length: 78
}, {
    id: 10,
    price: \"\$\$\$\",
    latitude: 65.4026,
    longitude: 21.1886684,
    uniqueFish: \"Pteropus rufus\",
    river: \"Northern Forest Canoe Trail\",
    length: 74
}, {
    id: 11,
    price: \"\$\$\$\",
    latitude: 29.00707,
    longitude: 114.246016,
    uniqueFish: \"Phalaropus lobatus\",
    river: \"Green River\",
    length: 100
}, {
    id: 12,
    price: \"\$\$\$\$\$\",
    latitude: 60.0528555,
    longitude: 23.6314746,
    uniqueFish: \"Alcelaphus buselaphus cokii\",
    river: \"Tuolumne River\",
    length: 13
}, {
    id: 13,
    price: \"\$\",
    latitude: 58.3493356,
    longitude: 13.8300629,
    uniqueFish: \"Catharacta skua\",
    river: \"Noatak River\",
    length: 61
}, {
    id: 14,
    price: \"\$\",
    latitude: 35.2099034,
    longitude: 107.7918964,
    uniqueFish: \"Spermophilus parryii\",
    river: \"Wabakimi Provincial Park\",
    length: 90
}, {
    id: 15,
    price: \"\$\$\",
    latitude: 24.965651,
    longitude: 102.591737,
    uniqueFish: \"Oryx gazella callotis\",
    river: \"Nahanni River\",
    length: 55
}, {
    id: 16,
    price: \"\$\$\$\",
    latitude: 34.810487,
    longitude: 117.323725,
    uniqueFish: \"Zenaida asiatica\",
    river: \"Gauley River\",
    length: 50
}, {
    id: 17,
    price: \"\$\$\$\",
    latitude: 53.5279314,
    longitude: -114.001928,
    uniqueFish: \"Coluber constrictor\",
    river: \"San Juan River\",
    length: 84
}, {
    id: 18,
    price: \"\$\",
    latitude: 43.1227567,
    longitude: 45.7420648,
    uniqueFish: \"Upupa epops\",
    river: \"Devils River\",
    length: 70
}, {
    id: 19,
    price: \"\$\",
    latitude: 14.972892,
    longitude: 8.8831506,
    uniqueFish: \"Panthera leo\",
    river: \"Clearwater River Canoe Trail\",
    length: 71
}, {
    id: 20,
    price: \"\$\$\",
    latitude: 38.0625172,
    longitude: 23.7946578,
    uniqueFish: \"Phalacrocorax albiventer\",
    river: \"Allagash Wilderness Waterway\",
    length: 65
}, {
    id: 21,
    price: \"\$\",
    latitude: 9.8422682,
    longitude: 11.3885001,
    uniqueFish: \"Phalacrocorax carbo\",
    river: \"John Day River\",
    length: 46
}, {
    id: 22,
    price: \"\$\$\",
    latitude: 47.2186081,
    longitude: 34.6661709,
    uniqueFish: \"Ictonyx striatus\",
    river: \"Rio Grande\",
    length: 77
}, {
    id: 23,
    price: \"\$\$\$\",
    latitude: 43.2625974,
    longitude: 23.6556259,
    uniqueFish: \"Anhinga rufa\",
    river: \"Chattooga River\",
    length: 46
}, {
    id: 24,
    price: \"\$\$\$\$\",
    latitude: 33.9485698,
    longitude: 44.9159938,
    uniqueFish: \"Theropithecus gelada\",
    river: \"Loxahatchee River\",
    length: 77
}, {
    id: 25,
    price: \"\$\$\",
    latitude: 50.480431,
    longitude: 121.682569,
    uniqueFish: \"Phoenicopterus ruber\",
    river: \"Pecatonica River\",
    length: 87
}]

const wildlife = [{
    id: 1,
    price: \"\$\$\$\$\",
    latitude: 57.6055534,
    longitude: 12.2028691,
    uniqueFish: \"Hystrix indica\",
    river: \"Eleven Point National Scenic River\",
    length: 22
}]

// Get the sum of all trail miles
const totalTrailMiles = (trails) => {
    let total = 0
    for (const trail of trails) {
        total = trail.length
    }

    return total
}

// Get the shortest of all trails
const shortyTrail = (trailArray) => {
    let shortest = 0
    for (const trail of trailArray) {
        if(trail.length < shortest) {
            shortest = trail.length
        }
    }

    return shortest
}

// Get the longest of all trails
const longTrail = (allTrails) => {
    let longest = 0
    for (const trail of allTrails) {
        if(trail.length >> longest) {
            longest = trail.length
        }
    }

    return longest
}


console.log(\`
    B J Ö R N ' S   W I L D N E R N E S S   A D V E N T U R E S
    ***********************************************************

                                                        ###
        ______                                         #o###
       /     /\\     (              ______            #####o###
      /     /  \\     )            /     /\\          #o#\\#|#/###
     /_____/----\\_    (          /     /  \\          ###\\|/#o#
    '     '          ).         /_____/----\\_         # }|{  #
   _ ___          O (:') o      '  '     '   '          }|{
  (@))_))        O ~/~~\\~ o                             }|{
                  o     O                          ____/   \\____
                     O
\`)


console.log('***************************************************')
console.log('*****              T R A I L S                *****')
console.log('***************************************************')
const trailTotal = totalTrailMiles(trails)
console.log(\`We service \${trailTotal} miles of wilderness trails across the US\`)

const shortTrail = shortestTrail(trails)
console.log(\`The shortest trail is \${shortTrail} kilometers\`)

const longest = longTrail(trails)
console.log(\`The longest trail is \${longest} kilometers\`)
" > adventure.js

