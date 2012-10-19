
include SugarCube::Adjust

class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    app         = AppController.alloc.init
    navController = UINavigationController.alloc.initWithRootViewController(app)
    navController.setNavigationBarHidden(true)

    @window.setRootViewController(navController)
    @window.makeKeyAndVisible

    true    
  end

end