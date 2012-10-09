include SugarCube::Adjust

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    back      = "tabbar_background".uiimage
    selection = "tabbar_cell_background".uiimage

    UINavigationBar.appearance.setBackgroundImage(back, forBarMetrics: UIBarMetricsDefault)

    tab = UITabBarController.alloc.init
    tab.tabBar.setBackgroundImage(back)
    tab.tabBar.setSelectionIndicatorImage(selection)
    
    timeline = TimelineViewController.alloc.initWithTabBar
    things   = ThingsViewController.alloc.initWithTabBar
    wish     = WishViewController.alloc.initWithTabBar
    lists    = ListsViewController.alloc.initWithTabBar
    add      = AddViewController.alloc.initWithTabBar

    tab.viewControllers = [timeline, things, wish, lists, add]
    tab.title           = "your BAG"
    
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tab)
    @window.makeKeyAndVisible
    
    true
  end
end
