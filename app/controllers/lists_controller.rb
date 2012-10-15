
class ListsViewController < UIViewController

  def initWithTabBar
    me = init
    me.tabBarItem = UITabBarItem.alloc.initWithTitle("lists", image:nil, tag:2)
    me
  end

  def viewDidLoad
    super
    # Do any additional setup after loading the view.
  end

end
