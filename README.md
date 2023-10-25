# android_solution
This is an application developed by GDSC Meru University android community.

## Note
This application is under development their will be changes.

## Getting Started
1. [setup Futter](https://docs.flutter.dev/get-started/install)
2. Clone the repo
 ```
$ git clone https://github.com/piexie3/android_solution
$ cd android_solution
 ```
If you have not downloaded git 
* For Windows [download here](https://git-scm.com/download/win) and run as administrator
* For Linux [Follow documentation here](https://git-scm.com/download/linux)
* For Mac OS [Follow documentation here](https://git-scm.com/download/mac)

3. Run the app by using this command
```
$ flutter run
```
## How to setup Firebase database 

* You will need to create a firebase account.
    * [click here to create a firebase account](https://console.firebase.google.com.)
    * click on the "console" in the top-right-hand menu
    * Click on "get started" button.
        * Enter the name of the project in this case will be "androidSolution"
        * (you can neglect google analytics)

Once your Firebase instance is created, you'll need to configure the project.

* Click on the project overview in the left-hand menu
    * select Android project(with android Icon)
    * Create an app within your Firebase instance for Android, with package name com.example.android_solution
    * Follow instructions to download google-services.json


You'll need to enable Authentication Methodes.

* Click "Authentication" in the left-hand menu
    * click on "get started"
    * Click the "sign-in method" tab
    * Click "Google" and enable it
    
You will need to enable the Firebase Database
* Click "Database" in the left-hand menu
    * Click the Cloudstore "Create Database" button
    * Select "Start in test mode" and "Enable"

After all configuration you have to go to <App-level>(build.gradle) in defaultConfig section change
`minSdkVersion flutter.minSdkVersion` to `minSdkVersion 21`

# Run the following command to get your SHA-1 key:

Alternative 1
```
keytool -exportcert -list -v \
-alias androiddebugkey -keystore ~/.android/debug.keystore
```
Alternative 2
Make sure you are in the project directory

Navigating to the Android Directory
```
$ cd android
```
Getting the signing reports
```
$ ./gradlew signingreport
```

In the Firebase console, in the settings of your Android app, add your SHA-1 key by clicking 

`Add Fingerprint`
* Add both SHA-1 and SHA-256

# Extra Resources
[Google Auth Plugin](https://pub.dartlang.org/packages/firebase_auth)

[Firestore Plugin](https://pub.dartlang.org/packages/cloud_firestore)

[Flutter packages](https://pub.dev)



## Features
- [x] Sign in Screen
- [x] Verification Screen
- [x] Firebase configuration
- [x] creating user with Email and password
- [ ] signing in user with email and password
- [ ] Home Screen
- [ ] Profile Screen




### Discussions
# What is the function of @override?
* The annotation @override marks an instance member as overriding a superclass member with the same name.
Example
code(
    class A {
  void foo() {
    print("Class A");
  }
}

class B extends A {}

class C extends A {
  @override foo() {
    print("Class C");
  }
}

void main() {
  A a = A();
  B b = B();
  C c = C();
  a.foo();
  b.foo();
  c.foo();
}
)
Output
```
Class A
Class A
Class Cs
```
