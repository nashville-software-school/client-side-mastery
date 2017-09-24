# The Block Module

```js
// Create the object upon which all other objects will be created
let DoctorOffice = Object.create({})

{
  // WeakMap to store private properties of the patient object
  const InstanceStorage = new WeakMap();    

  /*
    Function to return the object instance from the WeakMap.
    I only put it in all caps to make it stand out in this
    article's code.
  */
  const PRIVATE = function (object) {
    if (!InstanceStorage.has(object))
        InstanceStorage.set(object, Object.create(null));
    return InstanceStorage.get(object);
  }

  DoctorOffice.Doctor = Object.create({}, {
    // Initializer function
    init: {
      value: function () {
        PRIVATE(this).name = "doctor"
        PRIVATE(this).specialty = "specialty"
        PRIVATE(this).patients = []
      }
    },
    /*
      Public scope property that get/set a private property
      on the object stored in the WeakMap
    */
    name: {
      enumerable: true,
      get: function () {
        return PRIVATE(this).name
      },
      set: function (n) {
        PRIVATE(this).name = n
      }
    },
    /*
      Public scope property that get/set a private property
      on the object stored in the WeakMap
    */
    specialty: {
      enumerable: true,
      get: function () {
        return PRIVATE(this).specialty
      },
      set: function (n) {
        PRIVATE(this).specialty = n
      }
    },
    /*
      Public scope, read-only property 
    */
    patients: {
      enumerable: true,
      get: function () {
        return PRIVATE(this).patients
      }
    },
    /*
      Public scope method
    */
    addPatient: {
      value: function (patient) {
        PRIVATE(this).patients.push(patient)
      }
    }
  })
}
```

# Videos to Watch

1. []()
1. []()
1. []()

# Basic Keys and Values in Maps


# Lexskopistan Exercise

