
class BagController < UITableViewController

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

    view.rowHeight      = 50
    view.separatorStyle = UITableViewCellSeparatorStyleNone

    navigationController.title = "BAGin"

    SVProgressHUD.showWithStatus "loading your BAG"
    # SVProgressHUD.show
    Dispatch::Queue.concurrent("mc-data").async {
      data = File.read("#{App.resources_path}/things.json")
      @things = BW::JSON.parse(data)
      self.view.reloadData
      SVProgressHUD.dismiss
    }
  end

  # def viewDidAppear(animated)
  #   super
  #   # view.move_to([0,100])
  #   view.shake
  # end

  # def viewDidDisappear(animated)
  #   super
  #   view.move_to([0,640])
  # end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @things ? @things.length : 0
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    thing = @things[indexPath.row]
    BagCell.with_data(thing, inTableView:tableView)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    cell = tableView.cellForRowAtIndexPath(indexPath)
    cell.selected()
    thing_controller = BagThingsController.alloc.init
    navigationController << thing_controller
    thing_controller.bind_with_thing(@things[indexPath.row])
  end

end
