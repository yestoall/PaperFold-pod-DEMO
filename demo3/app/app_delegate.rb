
include SugarCube::Adjust

class AppDelegate

  def application application, didFinishLaunchingWithOptions:launchOptions

    UINavigationBar.appearance.tintColor = 0x000000.uicolor 
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    app        = AppController.alloc.init
    app_nav    = UINavigationController.alloc.initWithRootViewController(app)
    
    left       = LeftController.alloc.init
    left_nav   = UINavigationController.alloc.initWithRootViewController(left)
    left_nav.setNavigationBarHidden(true)
    
    right      = RightController.alloc.init
    right_nav  = UINavigationController.alloc.initWithRootViewController(right)
    right_nav.setNavigationBarHidden(true)
    
    top        = TopController.alloc.init
    top_nav    = UINavigationController.alloc.initWithRootViewController(top)
    top_nav.setNavigationBarHidden(true)

    bottom     = BottomController.alloc.init
    bottom_nav = UINavigationController.alloc.initWithRootViewController(bottom)
    bottom_nav.setNavigationBarHidden(true)

    paper = PaperController.alloc.init(app_nav)
    paper.set_left      left_nav,   150, 3
    paper.set_right     right_nav,  250, 5
    paper.set_top       top_nav,    200, 4
    paper.set_bottom    bottom_nav,  60, 2

    @window.backgroundColor = 0x000000.uicolor
    @window.setRootViewController(paper)
    @window.makeKeyAndVisible

    true    
    
  end

end