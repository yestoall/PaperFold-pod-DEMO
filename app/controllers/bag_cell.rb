
class BagCell < UITableViewCell
  
  def self.with_data(data,inTableView:tableView)
    cell = tableView.dequeueReusableCellWithIdentifier("cell") || BagCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"cell")
    cell.selectionStyle = UITableViewCellSelectionStyleNone
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator
    cell.fill_data(data, inTableView:tableView)
    cell    
  end

  def initWithStyle(style, reuseIdentifier: identifier)
      super
      @stylesheet = :main
      layout contentView do
        @back      = subview(UIView,  :back)
        @title     = subview(UILabel, :title)
        @count     = subview(UILabel, :count)
        subview(UIView,  :separator)
      end
      @count.layer.setCornerRadius(10)
      self
  end

  def fill_data(data,inTableView:tableView)
    @title.text = data["kind"]
    @count.text = "#{data['data'].length}"
  end

  def selected
    @back.backgroundColor = 0x222222.uicolor
    @title.textColor      = 0xFFFFFF.uicolor
  end

end