class WishViewController < UIViewController
  def initWithTabBar
    me = init
    img_on  = "tabbar_icon_wish".uiimage
    img_off = "tabbar_icon_wish_off".uiimage
    me.tabBarItem = UITabBarItem.alloc.initWithTitle("wish", image:nil, tag:3)
    me.tabBarItem.setFinishedSelectedImage(img_on, withFinishedUnselectedImage:img_off)
    me
  end

  def viewDidLoad
    super
    # Do any additional setup after loading the view.
  end

end
