# Firebase Hosting

## Install the Firebase CLI

```
npm install -g firebase-tools
```

## Initialize your app
`cd` into the root directory of your project run `firebase init` which creates your `firebase.json` file:

**Important note: You will be prompted for a directory folder to use as the public root; make sure the file that you make public contains your ENTIRE project.**  

Your JSON file will look something like this.
```json
{
  "hosting": {
    "public": "app",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ]
  }
}
```
The `public` property is required while the `ignore` is optional.

If you don't already have an `index.html` file in your public root directory, one is created for you.

## Deploy your website

Run `firebase deploy`

Your app will be deployed to the domain `<YOUR-FIREBASE-APP>.firebaseapp.com`

## Manage and rollback deploys
From the Hosting panel in the Firebase Console you can see a full history of your deploys. To rollback to a previous deploy, hover over its entry in the list, click the overflow menu icon, then click "Rollback".
