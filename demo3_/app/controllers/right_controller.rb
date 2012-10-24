
class RightController < UIViewController

  def init

    bounds = view.bounds.size
    
    trozo                 = UIView.alloc.initWithFrame([[0,0],[bounds.width,bounds.height]])
    trozo.backgroundColor = 0x999999.uicolor

    view << trozo

    self
  end

end