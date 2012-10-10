class ThingsViewController < UITableViewController

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

    Dispatch::Queue.concurrent("mc-data").async {
      data = File.read("#{App.resources_path}/things.json")
      @things = BW::JSON.parse(data)
    }
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @things ? @things.length : 0
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    id = "thing"
    cell = tableView.dequeueReusableCellWithIdentifier(id) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:id)
      cell
    end

    thing = @things[indexPath.row]
    cell.textLabel.text = thing["kind"]

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tc = ThingsTableViewController.init.alloc
    # self.navigationController.pushViewController(tc, animated:true)
    # things = @things[indexPath.row]
    # tc.bind_with_thing(things)
  end

end
