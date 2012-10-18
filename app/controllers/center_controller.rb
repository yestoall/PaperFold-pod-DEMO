
class CenterController < UITableViewController

  def initWithFrame(frame)
  end

  def viewDidLoad
    # super 

    @table = [
      { "id" => 1,  "name" => "uno" },
      { "id" => 2,  "name" => "dos" },
      { "id" => 3,  "name" => "tres" }
    ]

    view.rowHeight = 50

    # left = LeftView.alloc.initWithFrame(CGRectMake(0,0,100,self.view.bounds.size.height))
    # view.addSubview(left)
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @table ? @table.length : 0
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    id = "cell"
    cell = tableView.dequeueReusableCellWithIdentifier(id)
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault,reuseIdentifier:id)
    end

    data = @table[indexPath.row]
    cell.textLabel.text = data["name"]
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
  end

end
