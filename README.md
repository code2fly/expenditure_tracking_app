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

    * **Reactive frameworks** - 
      * similar to OEM frameworks in that they use UI widgets of the platform 
      * the difference is that our application logic is not compiled to native code (written in JS, UI is also written in JS but converted to UI of the platform).
      * the key piece is a bridge that allows JS code to communicate to the native platform, bridge allows us to get native performance in UI animations and transitions.
      * the challenges with OEM widgets is we need to deal with differences between the platforms i.e. not all UI widgets perform the same way on ios and android.

    * **Flutter framework** - 
      * while reactive and OEM framework use the UI widget of the platform, flutter does not , it rather uses SKIA 2d graphics library that is used in chrome , chromeos and android, firefox.. 
      * flutter uses skia framework to build ui widgets and only uses  canvas and event system of platform to communicate with the user.
        * this allows us to write apps that perform exactly the same way on each platform.
      * logic is written in dart but compiled to native code. (but how can flutter support hot reload and also compile to native code.)
        * reason is dart has evolved to support both JIT and AOT compilation
        * during development hot reload uses JIT to compile app.
        * for production AOT compiles to native code for each platform. 
        * channels allow us to write native code and have dart communicate with the native platform directly.
      * flutter structure - 
         ![alt](/screenshots/flutter_structure.PNG)


## Flutter basics - 

  * flutter run -d chrome --web-port 9090 --web-hostname=IPv4ip  -> to run app in web mode.
  * flutter build ios OR apk  -> builds a release
  * flutter install -> installs the release on connected device


  * **Scaffold** widget implements the basic material design visual layout structure. it is nice because it provides a lot of plumming for us.
    * it will expand and fill the entire screen.
    * also adds support for navigation bar.
    * if our compiler knows as compile time what a property to a widget will be then we should make that widget a const for performance gains with large apps.

  * **Widgets** - 
    * they are basic building block of flutter application.
    * they are immutable decleration that holds the configuration for the UI elements.
    * flutter uses widget to build a tree configuration that renders into the UI element, this rendering on the screen done using Skia library.
      * elements hold reference to the widget that helps it re-render when there are changes in widget.
      * keys are there in widget to help elements reference there widget in some situations. (state is created and maintained on the element.)
    * there are different types of widgets - 
      * Functional widgets - like buttons and menu
      * Style widgets - for colors and fonts
      * Layout widgets - Column, Row, Stack , Positioned
      * we can create our own widget by combining widget.
    * the Center widget will grow as big as possible but will center its child widget, but we can control how big the center widget grows by controlling heightFactor and widthFactor (how big center widget becomes based on child size).
    * dart supports both named and positional parameters in its methods. (positional parameters are required until they are wrapped in square braces, and we can also have required named parameters.)
    * Column widget is streched to full of parent vertically, it allows us to control how the childrens are displayed by setting the `mainAxis` using `mainAxisAlignment` property.

    * With flutter we talk about widget tree, this is how UI is configured, each widget hold configuration for that section of the tree.
      * when a top level widget is changed say underlying data is updated, the widgets below it are updated.
      * but the widget is not what is displayed on the screen, that is the element.
      * in flutter widget can be viewed as a configuration for element (element is visual aspect of the widget.).
	    * in widget there is a createElement method and when a widget is created it holds reference to the widget so that it knows when to update itself.
	    * Keys are there to help elements refer to widget in some situations, if no keys element hold reference based on type.


  
  * **StatelessWidget** - 
    * a widget that has that has no mutable state that it has to track. (it cannot remember anything from the last time it was built)
    * in general when a widget is built it is added to the widget tree.
    * when added to a tree framework calls the createElement() method on the widget.
    * this in turn creates an element and adds it to the element tree.
    * when the Text element is in the element tree it has a reference to the Text widget.
    * the element then calls build() method on the text widget.
    * if parameter of a text widget is changed (like in bootstarter app for counter of button) the previous widget is removed and a new widget is created
    and the element retrieves new text configuration from that widget.
    * ***but in our basic stateless app we do not have stateful widget then what causes our app to create widgets and element??*** - this is because of the `runApp` method in main.dart, this creates the main stateless widget that we are trying to create and start the whole process.
    ![alt](/screenshots/widget_element_tree.PNG)


  * **Material design Vs Cupertino design** - (by default we use material design - it combines classis principles of good design with innovation of tech and science, developed by google and most android app follow this design principle)
    * unlike material design apps mostly used by android , apple has its own design.
    * But why do we care if our material theme design is already rendering on ios platform?? 
      * maybe we are targeting a app for specific ios platform and cupertino theme.
    * flutter provides widgets that allow us to follow cupertino design.
    * with flutter material design app start with `MaterialApp` widget and to expose material design support to our widgets we use `Scaffold` or `Material` widget as the container or page.



  


  