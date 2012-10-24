
class LeftController < UIViewController

  def init

    bounds = view.bounds.size
    view.backgroundColor = 0x000000.uicolor
    
    trozo                 = UIView.alloc.initWithFrame([[0,0],[bounds.width,bounds.height]])
    trozo.backgroundColor = 0x333333.uicolor

    view << trozo

    self
  end

end