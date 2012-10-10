include SugarCube::Adjust

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    UINavigationBar.appearance.setBackgroundImage("back/plain".uiimage, forBarMetrics: UIBarMetricsDefault)
    UINavigationBar.appearance.tintColor = 0x222222.uicolor 

    tab = UITabBarController.alloc.init
    tab.tabBar.setBackgroundImage("tabbar_background".uiimage)
    tab.tabBar.setSelectionIndicatorImage("tabbar_cell_background".uiimage)
    
    timeline = TimelineViewController.alloc.initWithTabBar
    things   = ThingsViewController.alloc.initWithTabBar
    wish     = WishViewController.alloc.initWithTabBar
    user     = UserViewController.alloc.initWithTabBar
    add      = AddViewController.alloc.initWithTabBar

    tab.viewControllers = [timeline, things, wish, user, add]
    tab.title           = "your BAG"
    
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tab)
    @window.makeKeyAndVisible
    
    true
  end
end
