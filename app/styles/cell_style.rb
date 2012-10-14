
Teacup::Stylesheet.new :main do

  # style UINavigationBar,
  #   barStyle:           UIBarStyleBlack,
  #   tintColor:          "#444444".uicolor,
  #   translucent:        false,
  #   landscape: {
  #     tintColor:        UIColor.blackColor
  #   }

  # style UITableView,
  #   backgroundColor:    "#F3F3F3".uicolor,
  #   separatorColor:     "#eaeaea".uicolor,
  #   landscape:          true

  style UITableViewCell,
    backgroundColor:    0xEEEEEE.uicolor,
    separatorColor:     0x222222.uicolor,
    landscape:          true

  style :back,
    frame:              [[0,0],[320,50]],
    backgroundColor:    0xEEEEEE.uicolor

  style :title,
    numberOfLines:      0,
    frame:              [[10,0],[255,50]],
    font:               :bold.uifont(20),
    textColor:          0x222222.uicolor,
    backgroundColor:    :clear.uicolor

  style :count,
    numberOfLines:      0,
    frame:              [[265,15],[22,20]],
    font:               :bold.uifont(14),
    backgroundColor:    0xBBBBBB.uicolor,
    textColor:          0xFFFFFF.uicolor,
    textAlignment:      :center.uialignment

  style :separator,
    frame:              [[0,49],[320,1]],
    backgroundColor:    0xDDDDDD.uicolor

end