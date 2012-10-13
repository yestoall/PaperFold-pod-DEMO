class AddController < UIViewController

  def initWithTabBar
    me = init
    me.tabBarItem = UITabBarItem.alloc.initWithTitle("add", image:nil, tag:2)
    title = "ADD something to your BAG"
    me
  end

  def viewDidLoad
    super
    # Do any additional setup after loading the view.
  end

end
