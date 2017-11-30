# Angular Factories and Routing

## Angular Route

Install the Angular Route module. This library allows you to easily build a SPA (Single Page Application) where you switch out one view for another - without ever refreshing the browser - and break up your HTML into what are called *partials*.

```bash
npm install angular-route --save
```

Next, you add the `ng-view` helper to an empty element on your page. Later, when you create your partials and have configured Angular Route when to show each one, the HTML in those partials will be injected into this DOM element.

```html
<div ng-view></div>
```

Next, add `ng-route` to your angular application.  Inside app.js add the following.

```js
var app = angular.module("SongApp", [require('angular-route']);
```

### Partials

Partials are just like the Handlebar files you created in the previous Music History version. You'll be creating (usually) small HTML files that will be responsible for doing one thing only. For example, one file for showing a list of songs, another to show a form for creating a song, and another for displaying the details of a song.

```bash
mkdir partials
touch partials/song-list.html
```

Open your JSON file(s) and add an unique `id` key to each your song objects. Just start at 1 and increment.

```json
{
  "songs": [
    {
      "id": 1,
      "name": "Sharp Dressed Man",
      "artist": "ZZ Top",
      "album": "Eliminator"
    },
    ...
```

Next comment out all of your existing HTML in your `index.html` file. We're going to start using partials to display information. Here's what it should look like.

```html
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>NSS Starter Kit - Angular</title>
</head>

<body ng-app="SongApp">

  <div ng-view></div>

  <script src="lib/node_modules/angular/angular.min.js"></script>
  <script src="app/app.js"></script>
  <script src="app/controllers/SongCtrl.js"></script>
</body>
</html>
```

Next, open the `song-list.html` file and create a *partial* for listing songs.

```html
<div>
  <input type="text" ng-model="query" />
</div>

<div ng-repeat="song in songs | filter: query">
  <a href="#!/songs/{{ song.id }}">{{ song.name }}</a>
</div>
```

Notice anything strange about the anchor tag there? That's a strange looking URL for the `href` property. Well, since you're now starting the process of building a SPA, then you don't want any link to actually refresh the browser, and so by prepending the new location with #, you ensure that. You'll see this in action as we set up the routing.

### Initial route

Now that you have a partial, let's start using Angular routing to show it in the element with the `ng-view` attribute. First, we add an add in a new configuration object for our application, and set `$routeProvider` as a dependency.  Add this into your app.js file.

```js
app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/songs/list', {
        templateUrl: 'partials/song-list.html',
        controller: 'SongCtrl'
      });
  }
]);
```

What this does is make Angular now watch the values URL in the browser, and when it changes, it tries to match the pattern `/songs/list`. If it matches, it loads the HTML in our partial, and then binds that DOM to the `SongCtrl` controller. Try it out by putting this URL in your browser `http://localhost:8080/#!/songs/list`.

It should display your list of songs.

### Adding a new song

Add a new route for `/songs/new` and load the song form partial.

```js
app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/songs/list', {
        templateUrl: 'partials/song-list.html',
        controller: 'SongCtrl'
      }).
      when('/songs/new', {
        templateUrl: 'partials/song-form.html',
        controller: 'SongCtrl'
      });
  }]);
```

> **File:** partials/song-form.html

```html
<section>
  <div>
    Song name: <input type="text" ng-model="newSong.name" />
  </div>
  <div>
    Album Name: <input type="text" ng-model="newSong.album" />
  </div>
  <div>
    Artist: <input type="text" ng-model="newSong.artist" />
  </div>
  <button ng-click="addSong()">Add Song</button>
</section>
```

> **File:** app/controllers/SongCtrl.js

```js
app.controller("SongCtrl", ["$scope",
  function($scope) {
    $scope.newSong = { artist: "", album: "", name: ""};
    $scope.songs =[{ artist: "Britney", album: "In The Zone", name: "Toxic"}];

    $scope.addSong = function() {
      $scope.songs.push({
        artist: $scope.newSong.artist,
        name: $scope.newSong.name,
        album: $scope.newSong.album,
      });
    };
  }
]);
```

### Catch-all route

If you want to redirect the user to a particular route if they enter one that you currently don't have a view for, you can use the `otherwise` method on the route provider.

```js
app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.
    when('/songs/list', {
      templateUrl: 'partials/song-list.html',
      controller: 'SongCtrl'
    }).
    when('/songs/new', {
      templateUrl: 'partials/song-form.html',
      controller: 'SongCtrl'
    }).
    otherwise('/songs/list');
}]);
```

Now, if a route is visited at the URL `http://localhost/#!/songs/garbage` then the song list view will be loaded instead.

## Multiple controllers

Now, you may be wondering at this point if it's possible to break up this controller. One for managing the list of songs, and another for managing the song form. Yes, of course it is, and it's recommended, but then we run into the problem of how each of those controllers can read, and modify the same array of songs. Since the `$scope` object is not accessible outside the controller, if we read our songs from the JSON file in the song list controller, then somehow we have to share that with the song form controller so that it can add a new song to it.

## Factories

A factory is a way that you can send data between different controllers. Since each controller has its own scope, and another controller cannot access it, a factory acts as the intermediary, an escrow, between controllers.

Here's an example.

Let's say that you have two controllers, `SongListCtrl`, which will contain all the logic needed to list your songs, and `SongDetailCtrl` which will contain all the logic for displaying the details of individual songs. You don't want to make an XHR call in each of those controllers to get the list of songs. That's duplicating code, and that's *bad*.

You want one, common, mechanism that both controllers can use to get the list of songs. The factory is born. Let's look at a very simplistic construct, before we get to the XHR example.  First we will create a factories folder in the app folder.  Then we will add a SongFactory.js file to that folder.  Inside that file we will add the following:

```js
app.factory("SongFactory", function() {
  var songList = [
    { id: 1, name: "99 Problems", album: "Black", artist: "JayZ" },
    { id: 2, name: "Helter Skelter", album: "White", artist: "Beatles"  },
    { id: 3, name: "99 Problems", album: "Grey", artist: "DJ Danger Mouse"  }
  ];

  return {
    getSongs: function() {
      return songList;
    },
    getSong: function(id) {
      return songList.filter(function(song){
        return song.id === id;
      })[0];
    },
    addSong: function(song) {
      songList.push(song);
      return songList;
    }
  }
});
```

Now, in each of your controllers, you can get all songs, which is what you want in `SongListCtrl` , just get one song, which is what you want in `SongDetailCtrl`, or add a new song, which is what you want in `SongFormCtrl` . The factory is a singleton, meaning there's only, ever, one instance of this factory created, so you'll never have to worry about which version of the song list you're working with, because there's only one version. Period.

> **File:** SongListCtrl.js

```js
app.controller("SongListCtrl",
  // Notice the new syntax. Since I'm including one of my own dependencies
  // then I need to include each one in array of strings (just like RequireJS)
  // and have a matching argument in the callback function.
  [
    "$scope",
    "SongFactory",
    function($scope, SongFactory) {
      $scope.songs = SongFactory.getSongs();  // Returns all songs
    }
  ]
);
```

> **File:** SongDetailCtrl.js

```js
app.controller("SongDetailCtrl",
  [
    "$scope",
    "SongFactory",
    function($scope, SongFactory) {
      $scope.song = SongFactory.getSong(1); // Returns the song with id:1
    }
  ]
);
```

> **File:** SongFormCtrl.js

```js
app.controller("SongFormCtrl",
  [
    "$scope",
    "SongFactory",
    function($scope, SongFactory) {
      $scope.newSong = { artist: "", album: "", name: ""};

      $scope.addSong = function() {
        SongFactory.addSong({
          artist: $scope.newSong.artist,
          name: $scope.newSong.name,
          album: $scope.newSong.album
        });
      };
    }
  ]
);
```

Next we will need to change the controllers on our routes to reflect the above changes.  In app.js change the $routeProvider to the following:

```js
  $routeProvider
    .when('/songs/list', {
      templateUrl: 'partials/song-list.html',
      controller: 'SongListCtrl'
    })
    .when('/songs/new', {
      templateUrl: 'partials/song-form.html',
      controller: 'SongFormCtrl'
    })
    .otherwise('/songs/list');
```

Finally we will need to add script tags for our controllers and factory to index.html.  Always add factories before controllers.  You should now have the following script tags:

```html
  <script src="lib/node_modules/angular/angular.min.js"></script>
  <script src="app/app.js"></script>
  <script src="app/factories/SongFactory.js"></script>
  <script src="app/controllers/SongDetailCtrl.js"></script>
  <script src="app/controllers/SongListCtrl.js"></script>
  <script src="app/controllers/SongFormCtrl.js"></script>
```

## Connecting a JSON file

We are now ready to add a $http call to our SongFactory instead of hard coding the songs array.  To do this we will need to change two files: SongFactory and SongListCtrl.  In Song Factory change the getSongs function to:

```js
getSongs: function() {
  return $q(function(resolve, reject){
    $http.get('./data/songs.json')
      .then(function(objectFromJSONFile) {
        resolve(objectFromJSONFile.data.songs);
      }, function(error) {
        reject(error);
      });
  });
},
```

In the SongList Ctrl we will need to resolve the promise returned by $q.

```js
app.controller("SongListCtrl",
  [
    "$scope",
    "SongFactory",
    function($scope, SongFactory) {
      $scope.songs = [];
      SongFactory.getSongs().then(function (songs) {
        $scope.songs = songs;
      }, function (error) {
        console.log("Failed");
      });
    }
  ]
);
```

### Using chained promises

If you want to perform mutiple asynchronous operations, such as read from two separate JSON files, and then do something only after *all of the operations complete*, then you can chain them together just like with the original Q library.  Lets demonstrate this by creating a songs2.json file in the data folder.  Add three new songs to the json file.

Then we can add a `getMoreSongs` function to our SongFactory

```js
getMoreSongs: function() {
  return $http.get('./data/songs2.json')
      .then(function(objectFromJSONFile) {
        return objectFromJSONFile.data.songs
      })
},
```

Then we will need to resolve both promises and concatenate the two arrays in the SongListCtrl:

```js
app.controller("SongListCtrl",[ "$scope", "SongFactory", function($scope, SongFactory) {
  $scope.songs = [];
  var fullSongList=[];

  var allSongsPromise = SongFactory.getSongs()
    .then(function (firstArrayOfSongs) {
      fullSongList = fullSongList.concat( firstArrayOfSongs )
      return SongFactory.getMoreSongs()
    })
    .then(function(secondArrayOfSongs){
      fullSongList = fullSongList.concat( secondArrayOfSongs )
    });

  allSongsPromise.then(function () {
    $scope.songs = fullSongList;
  })
}]);
```

![Angular Architecture](../assets/angular-architecture.png)
