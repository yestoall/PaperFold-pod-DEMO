
class LeftController < UIViewController

  def init
    super

    bounds = view.bounds.size
    view.backgroundColor = 0x000000.uicolor

    trozo                 = UIView.alloc.initWithFrame(view.bounds)
    trozo.backgroundColor = 0x333333.uicolor

    view << trozo

    self
  end

end