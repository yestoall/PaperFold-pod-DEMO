
class BottomController < UIViewController

  def init
    super

    bounds = view.bounds.size

    view.setFrame([[0,0],[bounds.width,200]])

    trozo                 = UIView.alloc.initWithFrame(view.bounds)
    trozo.backgroundColor = 0x333333.uicolor

    view << trozo

    self
  end

end