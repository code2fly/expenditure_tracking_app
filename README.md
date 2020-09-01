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
  
  * **StatelessWidget** - 
    * a widget that has that has no mutable state that it has to track. (it cannot remember anything from the last time it was built)
    * in general when a widget is built it is added to the widget tree.
    * when added to a tree framework calls the createElement() method on the widget.
    * this in turn creates an element and adds it to the element tree.
    * when the Text element is in the element tree it has a reference to the Text widget.
    * the element then calls build() method on the text widget.
    * if parameter of a text widget is changed (like in bootstarter app for counter of button) the previous widget is removed and a new widget is created
    and the element retrieves new text configuration from that widget.
    * ***but in our basic stateless app we do not have stateful widget then what causes our app to create widgets and element*** - this is because of the `runApp` method in main.dart, this creates the main stateless widget that we are trying to create and start the whole process.
    ![alt](/screenshots/widget_element_tree.PNG)

  * With flutter we talk about widget tree, this is how UI is configured, each widget hold configuration for that section of the tree.
    * when a top level widget is changed say underlying data is updated, the widgets below it are updated.
    * but the widget is not what is displayed on the screen, that is the element.
    * in flutter widget can be viewed as a configuration for element (element is visual aspect of the widget.).
	  * in widget there is a createElement method and when a widget is created it holds reference to the widget so that it knows when to update itself.
	  * Keys are there to help elements refer to widget in some situations, if no keys element hold reference based on type.


  * **Material design Vs Cupertino design** - (by default we use material design - it combines classis principles of good design with innovation of tech and science, developed by google and most android app follow this design principle)
    * unlike material design apps mostly used by android , apple has its own design.
    * But why do we care if our material theme design is already rendering on ios platform?? 
      * maybe we are targeting a app for specific ios platform and cupertino theme.
    * flutter provides widgets that allow us to follow cupertino design.
    * with flutter material design app start with `MaterialApp` widget and to expose material design support to our widgets we use `Scaffold` or `Material` widget as the container or page.
    * ***the cupertino design can also be run on android, this is because unlike other frameworks flutter does not use(convert) native widgets of device unlike reactnative, nativescript and xamarin.***
    * all UI in flutter is drawn on platform canvas using SKIA framework.
    * sample code for cupertino app is in [cupertino branch](https://github.com/mcoder20/expenditure_tracking_app/tree/feature/cupertino_trial)

  
  * **Text, Icon, Image Support in flutter** - 
    * Icon widget has a positional property is IconData, it is essentially a int that holds a unicode for the image .
      * we can also use 3rd party icons like fontawesome.
    * semanticLabel property is most of the widgets, and used by screen readers for the visually impaired.
    * Image widget supports format like animated gif, gif, web, jpeg, png etc..
    * Image widget  encapsulates all the challenges that we have while working with images on to a nice easy to use widget. There are several constructors for loading images from different sources.
      * `Image.asset` for loading images from our application bundle
      * `Image.network` for obtaining image from a url. 
      * `Image.file` loads image from a file.
      * `Image.memory` loads an array of bytes.
    * by default image widget will take as much space that it can, but we can adjust it with width and height. though we should change only one of these property at a time and the other adjusts itself.
    * there are advanced features like fade-in of images and other flutter packages for images like image caching.

  * **Custom widget** - we can create custom widget by combining existing widgets.
    * the brackets block inside constructor parameter describe the optional parameters
    * to make a parameter mandatory it either needs to be before brackets as a positional parameter or @required should be used from meta.dart to make named parameter a required parameter.
    * if we know all the info of a widget at compile time we should make the contructor of that widget a const (recommended to use when all variables are final, improves performance).



## Flutter layouts and nativgation - 

  * **Container** widget is like a div tag in html
    * when alignment property is set on a container , it can grow to the size of its parent.
    * container without explicit width & height will size itself to wrap the child based on the parent's constraint.
  * Layout issues can be challenging to debug, we can use devtools to resolve those.
    * to activate devtools `flutter pub global activate devtools` - required only first time it is used.
    * to start devtool `flutter pub global run devtools` -> to this provide the websocket url you get while running the service.

  * **BoxDecoration** - used to add Corners , gradients and shadow effects to containers.
    * decoration and foregroundDecoration property in container decorates/paints additional widget around the child widget.

  * as we start building our app , the build method will start getting long and complex. to get over this we can - 
    1. break main build method into several supporting build methods like `Widget build(BuildContext context)  --> Widget header() --> Widget withdraw()`, each supporting build method builds out a child widget on the page. 
        * It makes the build method easier and cleaner to manage. (but this approach is also considered as a anti-pattern by many.)
    2. Instead what is suggested is if the build method is too big it should be split into seperate widgets not methods for better performance.
    

  * **Horizontal and vertical layouts** - using Row and Column
    * **Column** -
      * column's crossAxis constraint forces container to strech the width of the column but it does not forces the height to strech.
      * we can use `MediaQuery` if we want to set height and width of something based on remaining size of the screen. MediaQuery is a InheritedWidget, which lets us get access to the size of the screen.
      * for columns crossAxis runs left to right, mainAxis runs top to bottom.
    * **Row** - 
      * crossAxis runs top to bottom , mainAxis runs left to right.
      * to get more control over spacing we can use we can use a widget that has a flex property like `Spacer`.
        * we can add this at both ends and between widgets. (flex:2 , textwidget,flex:1,textWidget, flex:2  --> means spacer at each end are 2 times of the one in the center. the width is determined by remaining space the row has left.)

  * 1 thing we perform a lot in flutter is importing libraries, creating a library of widgets lets us cut down the number of imports we need to include.
    * to create a library in dart create index.dart file in the main folder containing different widgets in child folders.
    * first line of index.dart should be `library library_name;` followed by export of relative dart files from which we want to export widgets.

  * **Navigation between pages with routes** - 
    * for navigation between pages we can use `Drawer` widget.
    * routes are kept in a Map of path and WidgetBuilder.
    * to use route define initialRoute and then routes in the home page.
      * when we add these routes the hot reload will not work, coz since the statefulwidget store its state on the element , hot reload causes the element to call its build method on corresponding widget which results in re-building of widget tree but the element tree is not rebuilt --> the issue is bcoz hot reload will have elements call their widget's build method but the state object is not reloaded.
      * MaterialApp is a stateful widget and route information is stored in its state.
    * to add navigation functionality to drawer ListItems use `onTap` property with a method call to `Navigator.of(context)` -> this allows us to traverse up the tree to find a widget (context holds position of our widget in the element tree, from this we can navigate up the tree and find Navigator state ). with the Navigator state object we can push a new named route on to the stack `Navigator.of(context).pushNamed('/someroute')`.
