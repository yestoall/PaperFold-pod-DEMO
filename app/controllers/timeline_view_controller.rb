class TimelineViewController < UIViewController

  def initWithTabBar
    me = init
    img_on  = "tabbar_icon_timeline".uiimage
    img_off = "tabbar_icon_timeline_off".uiimage
    me.tabBarItem = UITabBarItem.alloc.initWithTitle("timeline", image:nil, tag:1)
    me.tabBarItem.setFinishedSelectedImage(img_on, withFinishedUnselectedImage:img_off)
    me
  end

  def viewDidLoad
    label               = UILabel.alloc.initWithFrame([[10,10],[280,50]])
    label.text          = "timeline"
    label.font          = "bag_app".uifont(40)
    label.textColor     = 0x222222.uicolor 
    label.textAlignment = :center.uialignment
    view << label

    # button = UIButton.alloc.initWithFrame([[0, 200], [10, 10]])
    # button.on(:touchupoutside, :touchcancel) { |event|
    #   puts event.inspect
    # }
    # view << button
  end

end
