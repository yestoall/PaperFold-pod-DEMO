class AddController < UIViewController

  def initWithTabBar
    me = init
    img_on  = "tabbar_icon_add".uiimage
    img_off = "tabbar_icon_add_off".uiimage
    me.tabBarItem = UITabBarItem.alloc.initWithTitle("add", image:nil, tag:5)
    me.tabBarItem.setFinishedSelectedImage(img_on, withFinishedUnselectedImage:img_off)
    title = "ADD something to your BAG"
    me
  end

  def viewDidLoad
    super
    # Do any additional setup after loading the view.
  end

end
