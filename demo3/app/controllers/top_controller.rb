
class TopController < UIViewController

  def init
    super

    trozo                 = UIView.alloc.initWithFrame(view.bounds)
    trozo.backgroundColor = 0x666666.uicolor

    view << trozo

    self
  end

end