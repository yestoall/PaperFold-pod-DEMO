class WishViewController < UIViewController
  def initWithTabBar
    me = init
    me.tabBarItem = UITabBarItem.alloc.initWithTitle("wish", image:nil, tag:2)
    me
  end

  def viewDidLoad
    super
    # Do any additional setup after loading the view.
  end

end
