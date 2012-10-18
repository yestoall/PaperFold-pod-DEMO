
include SugarCube::Adjust

class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = 0x00EE00.uicolor

    paper         = DemoController.alloc.init
    navController = UINavigationController.alloc.initWithRootViewController(paper)
    navController.setNavigationBarHidden(true)

    @window.setRootViewController(navController)
    @window.makeKeyAndVisible

    true    
  end

end

