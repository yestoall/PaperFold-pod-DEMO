class UserController < UIViewController

  def initWithTabBar
    me = init
    img_on  = "tabbar_icon_user".uiimage
    img_off = "tabbar_icon_user_off".uiimage
    me.tabBarItem = UITabBarItem.alloc.initWithTitle("you", image:nil, tag:4)
    me.tabBarItem.setFinishedSelectedImage(img_on, withFinishedUnselectedImage:img_off)
    me
  end

  def viewDidLoad
    super
    # Do any additional setup after loading the view.
  end

end
