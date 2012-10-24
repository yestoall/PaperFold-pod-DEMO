
class TopController < UIViewController

  def init

    bounds = view.bounds.size

    trozo                 = UIView.alloc.initWithFrame([[0,0],[bounds.width,bounds.height]])
    trozo.backgroundColor = 0x666666.uicolor

    view << trozo

    self
  end

end