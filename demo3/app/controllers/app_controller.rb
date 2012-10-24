
class AppController < UIViewController

  def init

    bounds = view.bounds.size

    view.setFrame([[0,0],[bounds.width,200]])
    
    trozo                 = UIView.alloc.initWithFrame([[0,0],[bounds.width,bounds.height]])
    trozo.backgroundColor = 0xFFFFFF.uicolor

    view << trozo
    self
  end

end