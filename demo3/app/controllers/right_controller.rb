
class RightController < UIViewController

  def init
    super

    bounds = view.bounds.size

    trozo                 = UIView.alloc.initWithFrame(view.bounds)
    trozo.backgroundColor = 0x999999.uicolor

    view << trozo

    self
  end

end