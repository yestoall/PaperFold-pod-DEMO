
class DemoController < UIViewController

  def init

    if (super)

      @data = [
        { "id" => 1,  "name" => "one" },
        { "id" => 2,  "name" => "two" },
        { "id" => 3,  "name" => "three" }
      ]

      bounds = self.view.bounds.size

      paper = PaperFoldView.alloc.initWithFrame([[0,0],[bounds.width,bounds.height]])
      paper.backgroundColor = 0x111111.uicolor
      paper.setAutoresizingMask(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)
      self.view.addSubview(paper)

      left = UIView.alloc.initWithFrame([[0,0],[200,bounds.height]])
      left.backgroundColor = 0x333333.uicolor
      paper.setLeftFoldContentView(left)

      center = UITableView.alloc.initWithFrame([[0,0],[bounds.width,bounds.height]])
      center.rowHeight = 80
      paper.setCenterContentView(center)
      center.setDelegate(self)
      center.setDataSource(self)

      paper.setDelegate(self)
      paper.setEnableRightFoldDragging(false)

      paper.setPaperFoldState(PaperFoldStateLeftUnfolded)
    end
    self

  end

  # --- table  ---

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @data ? @data.length : 0
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cellID = "cell"
    cell = tableView.dequeueReusableCellWithIdentifier(cellID) || begin
      cell                = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:cellID)
      cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator
      cell.selectionStyle = UITableViewCellSelectionStyleGray
      cell
    end

    item = @data[indexPath.row]
    cell.textLabel.text = item["name"]
    cell
  end

  # def tableView(tableView, didSelectRowAtIndexPath:indexPath)
  #   # cell = tableView.cellForRowAtIndexPath(indexPath)
  # end

end
