class ThingsViewController < UIViewController

  def initWithTabBar
    me = init
    img_on = "tabbar_icon_bag".uiimage
    img_off = "tabbar_icon_bag_off".uiimage
    me.tabBarItem = UITabBarItem.alloc.initWithTitle("things", image:nil, tag:2)
    me.tabBarItem.setFinishedSelectedImage(img_on, withFinishedUnselectedImage:img_off)
    me
  end

  def viewDidLoad
    super
    # Do any additional setup after loading the view.
  end

end
