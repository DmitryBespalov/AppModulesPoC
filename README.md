# AppModulesPoC

Proof of concept for using swift modules as parts of an iOS app

Goal is to build a technical prototype for modularizing the app code with swift package manager. 

## Learning Notes
- When moving existing code to a module, exposed classes need to have `public` access modifier
  - Same for initializers, methods, and properties
  - Overriden methods need `public` modifier
- Initializing from nib has to account for initializing from `Bundle.module` instead of bundle for a class or main bundle.
- XCUITests are not possible in Swift packages. Reason is that they need a target application. However, swift package is at most a macOS executable, and currently building iOS app from a swfit package is not supported. 
  - Workaround is to use a snapshot testing library that works in context of unit tests.
    - Drawback is that generated snapshot files will blow up the size of the repository. Repository configuration needs large file storage (GitHub LFS) so that checkouts are still fast.
- Modules can expose their bundle resources so that other module can use assets. Helpful for shared assets.
  - Better option is to use Sourcery to generate Swift handles for the assets. This way, when asset name changes, the compiler will flag that. Otherwise, the resources are referenced in code via file name string, which won't be updated automatically and not marked by a compiler.
- Modules can have their own Core Data models. Core data model needs to be loaded from a `Bundle.module`. 
  - One drawback is that the core data model can't autogenerate classes in the package.
    - To workaround, place the model in a Xcode project, generate classes in Xcode, then manually drag the generated files and the model to the package.

