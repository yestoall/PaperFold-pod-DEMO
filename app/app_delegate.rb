
include SugarCube::Adjust

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    UINavigationBar.appearance.setBackgroundImage("back/plain".uiimage, forBarMetrics: UIBarMetricsDefault)
    UINavigationBar.appearance.tintColor = 0x222222.uicolor 

    tab = UITabBarController.alloc.init
    tab.tabBar.setBackgroundImage("tabbar_background".uiimage)
    tab.tabBar.setSelectionIndicatorImage("tabbar_cell_background".uiimage)
    
    timeline = TimelineController.alloc.initWithTabBar
    bag      = BagController.alloc.initWithTabBar
    wish     = WishedController.alloc.initWithTabBar
    user     = UserController.alloc.initWithTabBar
    add      = AddController.alloc.initWithTabBar

    tab.viewControllers = [timeline, bag, wish, user, add]
    tab.title           = "BAG"
    
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tab)
    @window.makeKeyAndVisible
    true
  end
end

class Kernel

  def document(filename)
    @docs ||= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0]
    @docs.stringByAppendingPathComponent(filename)
  end

  def exists(filename)
    NSFileManager.defaultManager.fileExistsAtPath(filename)
  end

end
