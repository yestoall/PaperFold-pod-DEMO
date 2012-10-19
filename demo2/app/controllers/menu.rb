
class Menu < UIViewController
  include SimpleView::Layout

  def init
    self
  end

  def viewDidLoad

    bounds = UIScreen.mainScreen.bounds.size

    view.bounds          = [[0,0],[220,bounds.height]]
    view.backgroundColor = 0x333333.uicolor

    SimpleView::Styles.define :barra, width: 220, height: 10

    setup view, controller: self do
      rect name: "top",   styles: :barra, backgroundColor: "#000", left: 0, top: 0
      rect name: "abajo", styles: :barra, backgroundColor: "#000", left: 0, top: 450
    end
  end

end