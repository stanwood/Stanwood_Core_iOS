# Stanwood Core

## Project Organisations
Each Xcode project should be set with the following group structure in that order. This is so all our projects are consistent. [Project Organisation](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=31%3A107&scaling=min-zoom)

### Utilities
Always check that StanwoodCore does not provide this for free. Extensions, Helpers
### Services
Tracking, DFP, Networking(dataProvider), etc', 
### Model
Should contain `ModelCollection`, and `Model` types
### Views
Should contain any global custom views used
### Modules
Each module should be set as a sub-group and contains ModuleViewController, ModuleWireframe, ModulePresenter, ModuleActionable ,ModuleParamaterable, ModuleViewable, Module.storyboard, ModuleDataSource ,ModuleDelegate, ModuleCells 
###Stanwood
Should contain AppDelegate ,AppController, AppCoordinator, Paramaters, Actions, AppData 
Supporting Files
### Supporting Files
Plists, other assets etc.

## AppDelegate
Avoid adding any code to this class - it should only ever implement the functionality required by the Apple framework, instantiating and holding an AppController reference and nothing more. [AppDelegate](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=9%3A29&scaling=min-zoom)

##AppController
The `AppController` has a reference to the root window. Use `appController` to implements any functionality on a global state, `auth()`, `fetchConfigurations()`, `reachability()` as an example. It implements each `actionable`, `presentable`, and `viewable` protocol that is injected into each of the presenters. [AppController](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=9%3A43&scaling=min-zoom)

## AppData
Use this class for all global data model. It should only hold data model. [AppData](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=31%3A50&scaling=min-zoom)

## Coordinator
The Coordinator controls what is displayed at all times. It creates wireframes, prepares and presents. [Coordinator](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=31%3A58&scaling=min-zoom)

## Wireframe
The wireframe is a struct in which all of the functions are static.  It always consists of a `makeViewController` function which will return a subclass of `UIViewControlleror` a `UINavigationController`, and a prepare function, which will connect the view controller to all the other classes in the module.

The make function encapsulates the loading of a storyboard and then the viewController in question.  The prepare function should pass in any data to build the module and inject them into the classes and structs.  The prepare function should inject an object that implements the appropriate...actionable,...paramaterable, and...viewableprotocol into the presenter.  [Wireframe](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=88%3A0&scaling=min-zoom)

```
struct CarsWireframe {
  static func makeViewController() -> CarsViewController {
    /// instantiate controller from code, storyboard or Xib
  }
  
  static func prepare(viewController: CarsViewController, with actionable: CarsActionabel, _ paramaterable: CarsParamaterable) -> CarsViewController {
    /// all the code to connect the objects
  }
}
```
## Presenter
The presenter implements all the logic and processing needed to display information on the screen, leaving the viewController with the task of the purely UI-specific elements. 

The presenter communicates back to Actions via an action object that implements the actionable protocol. The presenter communicates with the viewable object to display information on the screen. The presenter calls paramaterable via a parameter object to get all the view specific parameters. Each UI element that triggers a background process, must communicate via the presenter to invoke the call. It must keep a weak reference to the viewable object.

Since a `UITableView` or `UICollectionView` only keeps weak references to a data source and delegate, the presenter must have a strong reference for each of these classes.

When creating a new presenter call, it must conform to the Presentable protocol and defineactionable, viewable, and paramaterable. If the presenter is a sourceType based presenter, then it must also conform toSourceTypePresentable, which will define the dataSource and delegate. [Presenter](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=2%3A10&scaling=min-zoom)

## Actionable protocol 
This defines a protocol for each module that contains the call back functions for each action on the screen. It may also initiate a request that in turn invokes for networking calls and background processes and passes the responses back to the presenter, and manages the feedback to the user.  [Actionable](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=9%3A23&scaling=min-zoom)
For example: 

```
protocol CarsActionable {
    func getCars(for order: Order) -> Cars
    func makeOrder(with car: Car)
    func present(_ order: Order)
}
extension Actions: CarsActionable {
    func getCars(for order: Order) -> Cars {
    /// Fetch cars
    }
    
    func makeOrder(with car: Car) {
    /// Make an order
    }
    
    func present(_ order: Order) {
    /// Call coordinator and present order
    }
}
```
## Viewable protocol
This defines a protocol for each UIViewController and communicates with the presenter to display information on the screen.  [Viewable](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=9%3A1&scaling=min-zoom)
```
protocol CarsViewable {
  var collectionView: UICollectionView! { get set }
}

class CarsViewController: CarsViewable {

  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
```
## Parameterable protocol
This defines a protocol for each module that contains all the view parameters. [Parameterable](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=9%3A25&scaling=min-zoom)

```
protocol CarsParamaterable {
  var cars: Cars { get }
}

extension Paramaters: CarsParamaterable {
  var cars: Cars {
    return appData.cars
  }
}
```
## ViewController
It must keep a strong reference to the presenter. All events (including button actions) make call backs to the presenter.  This class should contain the bare minimum of code that is needed for initialisation and styling.  [ViewController](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=2%3A3&scaling=min-zoom)

## DataSource, Delegate, ModelCollection, and Model
Always separate out the data source and delegate from the view controller and presenter.  The data source and delegate should be the only class that knows about the cells in the table or collection view. Utilise Stanwood.Elements to instantiate a collection of elements, and inject them to the data source, and delegate. Always subclass AbstractDataSource and AbstractDelegate and make sure each cell conforms to the Fillable protocol.  
[DataSource](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=51%3A28&scaling=min-zoom)

 [Delegate](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=55%3A38&scaling=min-zoom)
 
  [ModelCollection](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=51%3A47&scaling=min-zoom)
  
   [Model](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=55%3A18&scaling=min-zoom)

BLAH BLAH WAIT FOR REVIEW
## Configurations & Constants
[Configurations & Constants](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=31%3A107&scaling=min-zoom)

```
struct Configuration {

    /// group dynamic lets into named structs
}

struct Constants {     

   /// group static lets into named structs 
}
```
## Services
Services should have a reference in Actions and report back topresenter.  [Services](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=31%3A107&scaling=min-zoom)

## Networking
This layer is super basic and relies heavily on Moya. Its best to view the example project for a more in depth insight into how moya works.  In short, the network layer has one exposed function that returns an initialised result. We use Generics to infer the type and either turn the object or an error.

as a general rule, the only class to access this will be the `DataProvider`  [Networking](https://www.figma.com/proto/AO3XMoeps1Yjj7aia5HpmA/Untitled?node-id=31%3A34&scaling=min-zoom)
