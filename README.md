## Mobile app basics - 


  * Types of mobile apps - 

    * **Native app** - 
	  * the platform ios/android provides api's to interact with services like camera, filesystem, network etc.
	  * the ui components like text widget,button etc are provided using Platform widget and rendered over canvas , it provides event mechanism for interaction with these widgets.
	  * our business logic is written in native code (java/kotlin for android and objective-c/swift for ios) that interacts with service api's and widgets.
	
    * **Hybrid app** - like ionic(uses angular as core framework)
	  * it uses WebView instead of platform widgets to display UI components.
	  * business logic is written in JS with html/css and plugins are used to interact with services.
	  * problem - our UI , business logic and animation all run in same single thread , so if not careful we have a sluggish UI.

    * **OEM (original equipment manufacturer) frameworks**- e.g. Xamarin
	  * they use widgets of actual platform (OEM widgets in code are later changed into platform specific widgets).
	  * the application is written in languages other than the native ones but it is still compiled to native and installed on platform.


## Flutter basics - 

  * flutter run -d chrome --web-port 9090 --web-hostname=IPv4ip  -> to run app in web mode.
  * flutter build ios OR apk  -> builds a release
  * flutter install -> installs the release on connected device

  * while others use either webview or UI platform widgets flutter does not , it rather uses SKIA 2d graphics library.
    * flutter uses skia framework to build ui widgets and only uses  canvas and event system of platform to communicate with the user.
    * this allows to write apps that perform exactly the same way on each platform.

  * logic is written in dart but compiled to native code. (but how can flutter support hot reload and also compile to native code.)
    * reason is dart has evolved to support both JIT and AOT compilation
    * during development hot reload uses JIT to compile app.
    * for production AOT compiles to native code for each platform.

  * **Widgets** - 
    * they are basic building block of flutter application.
    * they are immutable decleration that holds the configuration for the UI elements.
    * flutter uses widget to build a tree configuration that re nders into the UI element, rendering on the screen done using Skia library.


  * With flutter we talk about widget tree, this is how UI is configured, each widget hold configuration for that section of the tree.
    * when a top level widget is changed say underlying data is updated, the widgets below it are updated.
    * but the widget is not what is displayed on the screen, that is the element.
    * in flutter widget can be viewed as a configuration for element (element is visual aspect of the widget.).
	  * in widget there is a createElement method and when a widget is created it holds reference to the widget so that it knows when to update itself.
	  * Keys are there to help elements refer to widget in some situations, if no keys element hold reference based on type.

  * **Scaffold** widget implements the basic material design visual layout structure. it is nice because it provides a lot of plumming for us.
    * it will expand and fill the entire screen.
    * also adds support for navigation bar.
    * if our compiler knows as compile time what a property to a widget will be then we should make that widget a const for performance gains with large apps.