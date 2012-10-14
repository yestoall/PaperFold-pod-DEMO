
class ConsumedController < UITableViewController

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

    # view.backgroundColor = 0x00FF00.uicolor
    # view.setSeparatorColor(0xCCCCCC.uicolor)

    navigationController.title = "BAGin"

    SVProgressHUD.showWithStatus "loading your BAG"
    # SVProgressHUD.show
    Dispatch::Queue.concurrent("mc-data").async {
      data = File.read("#{App.resources_path}/things.json")
      @things = BW::JSON.parse(data)
      self.view.reloadData
      SVProgressHUD.dismiss
    }

    # Parse.setApplicationId("Ks9i6obkdtMpCXaQVV6SHZCym0uTdmwTCGSUhnUc", clientKey:"RkC2BwMyoSoGTEtOaWGx92ZWyf191FM4tu8oJ0i5")
    # data = PFObject.objectWithClassName("ThingObject")
    # data.setObject("bar", forKey:"foo")
    # data.save
  end

  def viewDidAppear(animated)
    super
    # view.move_to([0,100])
    view.shake
  end

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
    ThingsCell.cell_data(thing, inTableView:tableView)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    cell = tableView.cellForRowAtIndexPath(indexPath)
    cell.selected()
    thing_controller = ThingsController.alloc.init
    navigationController << thing_controller
    thing_controller.bind_with_thing(@things[indexPath.row])
  end

end
