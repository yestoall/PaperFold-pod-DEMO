
class AppController < UIViewController

  MENU_TABLE    = 1
  CONTENT_TABLE = 2

  def init

    @menu = [
      { "title" => "menu 1" },
      { "title" => "menu 2" },
      { "title" => "menu 3" },
      { "title" => "menu 4" },
      { "title" => "menu 5" },
      { "title" => "menu 6" }
    ]

    @data = [
      { "id" => 1,  "name" => "option one" },
      { "id" => 2,  "name" => "option two" },
      { "id" => 3,  "name" => "option three" }
    ]

    bounds = self.view.bounds.size

    menu           = UITableView.alloc.initWithFrame([[0,0],[220,bounds.height]])
    menu.tag       = MENU_TABLE
    menu.rowHeight = 40
    menu.setDelegate(self)
    menu.setDataSource(self)

    center           = UITableView.alloc.initWithFrame([[0,0],[bounds.width,bounds.height]])
    center.tag       = CONTENT_TABLE
    center.rowHeight = 80
    center.setDelegate(self)
    center.setDataSource(self)

    paper                 = PaperFoldView.alloc.initWithFrame([[0,0],[bounds.width,bounds.height]])
    paper.backgroundColor = 0x000000.uicolor
    paper.setAutoresizingMask(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)

    paper.setLeftFoldContentView(menu)
    paper.setCenterContentView(center)
    paper.setDelegate(self)
    paper.setEnableRightFoldDragging(false)
    paper.setPaperFoldState(PaperFoldStateLeftUnfolded)

    view << paper

    self
  end

  # --- table  ---

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    case tableView.tag
    when MENU_TABLE
      @menu ? @menu.length : 0
    when CONTENT_TABLE
      @data ? @data.length : 0
    end
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    case tableView.tag
    when MENU_TABLE
      cellID = "cell_menu"
      data = @menu[indexPath.row]["title"]
    when CONTENT_TABLE
      cellID = "cell_content"
      data = @data[indexPath.row]["name"]
    end

    cell = tableView.dequeueReusableCellWithIdentifier(cellID) || begin
      cell                = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:cellID)
      cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator
      cell.selectionStyle = UITableViewCellSelectionStyleGray
      cell
    end

    cell.textLabel.text = data
    cell
  end

  # def tableView(tableView, didSelectRowAtIndexPath:indexPath)
  #   # cell = tableView.cellForRowAtIndexPath(indexPath)
  # end
end
