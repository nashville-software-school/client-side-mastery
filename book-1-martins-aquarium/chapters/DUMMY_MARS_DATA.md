# Mars Probe Data

Before you start fetching data from the live API, you need to review what the data structure looks like that you will be working with. It's quite complex.

1. The entire response will be an object. You can tell this because the first character is a curly brace.
1. The object has a single property of `"photos"`.
1. The photos property is an array.
1. That array contains objects.
1. Each photo object has several properties.
    * id (integer)
    * sol (integer)
    * camera (object)
    * img_src (URL string)
    * earth_date (date string)
    * rover (object)

Here is a sample response for requesting the photos that Spirit took on the 1001st day of its mission. This isn't even the full response!! It's just one of the photos. The entire response is at the end of the chapter.

```json
{
    "photos": [
        {
            "id": 341797,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215225981EFFAS00P2573L2M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        }
    ]
}
```

Now, you have no control over this data's structure. The developers who work for NASA do _(what a cool job that would be!)_. What you have control over is what parts of this data you will be using for your application.

Time to reconsider Debra's requirements for this application again. Then you need to decide which parts of the data that NASA provides you will need to give Debra what she needs.

#### Requirements

* View Mars probe photos on a specific date.
* View the weather on Mars on a specific date.
* Mark certain dates as her favorites.
* List all favorited dates.
* Remove dates from her favorite list.
* Filter photos by specific cameras. Each probe has a different set of cameras.

Which properties do you think you need to care about? This would be a great discussion to have with an instructor - **after you have carefully considered it**.

> **REMINDER**: Remember, you're not going for 100% correct on the first try. Perfectionism is the killer. Reasoned risk-taking and then refactoring based on results is how the best solution is discovered.


## Data Provider

Now it's time to create the data provider for Mars probe photos. For now you are going to hard code the `photos` property of the response as the data.

#### `scripts\photos\PhotoDataProvider.js`

```js
let photos = {paste the hard-coded data here}

/*
    Export a function that lets other components have
    access to the data
*/
```

## Spirit Photos on Sol 1001

Full response from the NASA API.

```json
{
    "photos": [
        {
            "id": 341797,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215225981EFFAS00P2573L2M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341798,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226019EFFAS00P2573L5M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341799,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226046EFFAS00P2573L7M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341800,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226107ESFAS00P2842L2M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341801,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226137ESFAS00P2842L5M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341802,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226168ESFAS00P2842L7M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341803,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226241ESFAS00P2574R1M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341804,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226282ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341805,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226311ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341806,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226340ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341807,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226369ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341808,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226410ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341809,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226458ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341810,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226545ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341811,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226593ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341812,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226660ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341813,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226711ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341814,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226769ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341815,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226829ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341816,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226871ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341817,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226941ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341818,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215226993ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341819,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215227059ESFAS00P2574L6M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341820,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215227414ESFAS00P2600L8M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        },
        {
            "id": 341821,
            "sol": 1001,
            "camera": {
                "id": 30,
                "name": "PANCAM",
                "rover_id": 7,
                "full_name": "Panoramic Camera"
            },
            "img_src": "http://mars.nasa.gov/mer/gallery/all/2/p/1001/2P215227414ESFAS00P2600R8M1-BR.JPG",
            "earth_date": "2006-10-28",
            "rover": {
                "id": 7,
                "name": "Spirit",
                "landing_date": "2004-01-04",
                "launch_date": "2003-06-10",
                "status": "complete",
                "max_sol": 2208,
                "max_date": "2010-03-21",
                "total_photos": 124550,
                "cameras": [
                    {
                        "name": "FHAZ",
                        "full_name": "Front Hazard Avoidance Camera"
                    },
                    {
                        "name": "NAVCAM",
                        "full_name": "Navigation Camera"
                    },
                    {
                        "name": "PANCAM",
                        "full_name": "Panoramic Camera"
                    },
                    {
                        "name": "MINITES",
                        "full_name": "Miniature Thermal Emission Spectrometer (Mini-TES)"
                    },
                    {
                        "name": "ENTRY",
                        "full_name": "Entry, Descent, and Landing Camera"
                    },
                    {
                        "name": "RHAZ",
                        "full_name": "Rear Hazard Avoidance Camera"
                    }
                ]
            }
        }
    ]
}
```