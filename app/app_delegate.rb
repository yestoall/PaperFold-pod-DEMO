include SugarCube::Adjust

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    img_texture_black = "subtle_carbon".uiimage
    img_texture_white = "subtle_dots".uiimage
    img_back          = "tabbar_background".uiimage
    img_selection     = "tabbar_cell_background".uiimage

    UINavigationBar.appearance.setBackgroundImage(img_texture_black, forBarMetrics: UIBarMetricsDefault)

    tab = UITabBarController.alloc.init
    tab.tabBar.setBackgroundImage(img_back)
    tab.tabBar.setSelectionIndicatorImage(img_selection)
    
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
