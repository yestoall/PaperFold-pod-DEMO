
class BagController < UITableViewController

  def initWithTabBar
    me = init
    img_on        = "tabbar_icon_bag".uiimage
    img_off       = "tabbar_icon_bag_off".uiimage
    me.tabBarItem = UITabBarItem.alloc.initWithTitle("bag", image:nil, tag:2)
    me.tabBarItem.setFinishedSelectedImage(img_on, withFinishedUnselectedImage:img_off)
    me
  end

  def plist
    document("bag.plist")
  end

  def persist
    @bag.writeToFile(plist, atomically:true)
  end

  def load_bag
    SVProgressHUD.showWithStatus "loading your BAG"
    # if exist(plist)
    #   @bag = NSArray.alloc.initWithContentsOfFile(plist)
    # else
      @bag = 
      [
        { "id" => 1,  "kind" => "Movies",     "count" => 3 },
        { "id" => 2,  "kind" => "TV Series",  "count" => 2 },
        { "id" => 3,  "kind" => "Books",      "count" => 1 },
        { "id" => 4,  "kind" => "Music",      "count" => 0 }
      ]
      view.reloadData
      persist
    # end
    SVProgressHUD.dismiss
  end

  def viewDidLoad
    super

    view.rowHeight      = 50
    view.separatorStyle = UITableViewCellSeparatorStyleNone

    load_bag

    # self.title = "kaka mala"
    # self.navigationController.title = "kaka mala"

    # SVProgressHUD.showWithStatus "loading your BAG"
    # # SVProgressHUD.show
    # Dispatch::Queue.concurrent("mc-data").async {
    #   data = File.read("#{App.resources_path}/things.json")
    #   @things = BW::JSON.parse(data)
    #   self.view.reloadData
    #   SVProgressHUD.dismiss
    # }
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    # @things ? @things.length : 0
    @bag ? @bag.length : 0
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    data = @bag[indexPath.row]
    BagCell.with_data(data, inTableView:tableView)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    cell = tableView.cellForRowAtIndexPath(indexPath)
    cell.selected()
    thing_controller = BagThingsController.alloc.init
    navigationController << thing_controller
    thing_controller.bind_with_thing(@bag[indexPath.row])
  end

end
