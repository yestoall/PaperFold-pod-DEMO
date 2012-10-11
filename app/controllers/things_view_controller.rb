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

    view.rowHeight         = 60
    view.separatorStyle    = UITableViewCellSeparatorStyleNone
    view.setSeparatorColor(0xCCCCCC.uicolor)

    navigationItem.title = "your BAG"

    Dispatch::Queue.concurrent("mc-data").async {
      data = File.read("#{App.resources_path}/things.json")
      @things = BW::JSON.parse(data)
      self.view.reloadData
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
      # cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier:id)
      cell = StyledTableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier:id)

      cell.accessoryType   = UITableViewCellAccessoryDisclosureIndicator
      cell.backgroundColor = 0xEEEEEE.uicolor
      # cell.setStyledTableViewCellSelectionStyle(StyledTableViewCellSelectionStyleYellow)

      cell
    end

    thing = @things[indexPath.row]

    cell.textLabel.text            = thing["kind"]
    cell.textLabel.textColor       = 0x222222.uicolor
    cell.textLabel.font            = UIFont.boldSystemFontOfSize(20)

    cell.detailTextLabel.text      = "#{thing["data"].length}"
    cell.detailTextLabel.textColor = 0xCCCCCC.uicolor
    cell.detailTextLabel.font      = UIFont.systemFontOfSize(18)

    cell.selectionStyle            = UITableViewCellSelectionStyleGray;

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    thing_controller = ThingsTableViewController.alloc.init
    navigationController << thing_controller
    thing_controller.bind_with_thing(@things[indexPath.row])
  end

end
