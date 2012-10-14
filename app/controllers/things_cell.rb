
class ThingsCell < UITableViewCell
  
  def initWithStyle(style, reuseIdentifier: identifier)
      super
      @stylesheet = :main
      layout contentView do
        @back      = subview(UIView,  :back)
        @title     = subview(UILabel, :title)
        @count     = subview(UILabel, :count)
        @separator = subview(UIView,  :separator)
      end
      @count.layer.setCornerRadius(10)
      self
  end

  def self.cell_data(data,inTableView:tableView)
    cell = tableView.dequeueReusableCellWithIdentifier("cell") || ThingsCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"cell")
    cell.selectionStyle              = UITableViewCellSelectionStyleNone
    cell.accessoryType               = UITableViewCellAccessoryDisclosureIndicator
    cell.fill_data(data, inTableView:tableView)
    cell    
  end

  def fill_data(data,inTableView:tableView)
    @title.text = data["kind"]
    @count.text = "#{data['data'].length}"
  end

  def selected
    @back.backgroundColor = 0xBBBBBB.uicolor
  end

  # def prepareForReuse
  #   # clear out any text labels etc. here for reuse
  # end
  
end