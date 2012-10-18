
class LeftView < UIView

  def initWithFrame(frame)
    if super
      super
    end
  end

  def viewDidLoad
    label                 = UILabel.alloc.initWithFrame([[10,10],[100,150]])
    label.text            = "left"
    label.textColor       = 0x222222.uicolor 
    label.backgroundColor = 0xFF0000.uicolor
    label.textAlignment   = :left.uialignment
    view << label
  end

end