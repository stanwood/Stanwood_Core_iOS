# Change Log

## 1.5.2
- Adding the `MetaModule` protocol to define at compile time all the main types of a module
- Adding the generic `Wireframe` and `BasePresenter` classes to automatically provide some functionalities like `module` and `Presenter` initialization 
- Adding `HasPresenter` module to define the  `has` relationship between a `UIViewController` and a `Presenter`
- Adding documentation

## 1.5.0
- Upgrading to `Swift 5.0`
- Seperating SourceType and Core into another framework `pod 'SourceModel'`

## 1.4.2
- Adding UserAgent support
- Adding `applicationSupportDirectory` to `Storage.swift`
- Minor bug fix

## 1.4 

- Namespacing
- Fixing a bug with `Elements`
- Improving `Delegateable` protocol implementation

## 1.3 

- Swift 4.2
- `Typeable`: Codable is not required now
- `Type`: id is now removed
- New device support the device.type
- Other small changes
- *AutosizeableCell* iOS 12 support

## 1.2.2

- Bug fixing

## 1.2

- stanwood Architecture 1.3 improvements
- Adding `Headerable` protocol to support headers for `UICollectionView` and `UITableView`
- Adding `Delegateble` protocol to support multiple delegates when using `SourceType`
- General improvements

## 1.1.3

- Fixing `Stanwood.Sections` to support different types of `DataType`

## 1.1.2

- Making Stanwood.Elements subscipt and save/load `open`

## 1.1.1

- Making numberOfItems and numberOfSections open

## 1.1

- Adding `Stanwood.Sections`, support for sections in `UITableView` and `UICollectionView`

## 1.0.1

- Public release

## 0.2.3

- `Stanwood.Objects` has been renamed to `Stanwood.Elements` to follow Swift naming conventions.
- Adding `cellType(forItemAt:)` to `DataType` protocol to hanndle `cellForItem` in the abstract level.
- Adding `SourceTypePresentable` to support Stanwood Architecture 1.0
- Adding `UITestingCore` bridge for `StanwoodUITestingCore` framework

## 0.2.2

- Fixing `Loadable` non-static function

## 0.1.8

- Fixing number of rows in section, in `Stanwood.AbstractTableDataSource`

## 0.1.7

- Fixing `Loadable`
- Fixing UIView extention `addShadow` default values
- Removed duplciate extensions
- Adding `DataSourceType` & `DelegateSourceType` protocol to support DataSource and Delegate
- Adding `Presentable` protocol
- Chaning naming in `Stanwood.Objects`
