
# PaperController rubymotion port for honcheng's PaperFold-for-iOS
#
# nacho@yestoall [2012.09.24]

class PaperController < UIViewController

  BACKGROUND_COLOR = 0x000000.uicolor

  def init rootViewController
    super()

    view.setAutoresizesSubviews(true)
    
    bounds = view.bounds.size

    @paper = PaperFoldView.alloc.initWithFrame(view.bounds)
    @paper.setBackgroundColor(BACKGROUND_COLOR)
    view << @paper

    @paper.setDelegate(self)
    @paper.setAutoresizingMask(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)

    @root = rootViewController
    @root.view.setFrame(view.bounds)
    @root.view.setAutoresizingMask(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)
    @paper.setCenterContentView(@root.view)

    self
  end

  def set_right the_view, width, folds, pull_factor=0.9
    @right = the_view
    @right.view.setFrame([[0,0],[width,self.view.bounds.size.height]])
    @paper.setRightFoldContentView(@right.view, foldCount:folds, pullFactor:pull_factor)
  end

  def set_left the_view, width, folds, pull_factor=0.9
    @left = the_view
    @left.view.setFrame([[0,0],[width,self.view.bounds.size.height]])
    @paper.setLeftFoldContentView(@left.view, foldCount:folds, pullFactor:pull_factor)
  end

  def set_top the_view, height, folds, pull_factor=0.9
    @top = the_view
    @top.view.setFrame([[0,0],[self.view.bounds.size.width,height]])
    @paper.setTopFoldContentView(@top.view, topViewFoldCount:folds, topViewPullFactor:pull_factor)
  end

  def set_bottom the_view, height, folds, pull_factor=0.9
    @bottom = the_view
    @bottom.view.setFrame([[0,0],[self.view.bounds.size.width,height]])
    @paper.setBottomFoldContentView(@bottom.view, bottomViewFoldCount:folds, bottomViewPullFactor:pull_factor)
  end

# - (void)paperFoldView:(id)paperFoldView didFoldAutomatically:(BOOL)automated toState:(PaperFoldState)paperFoldState
# {
#     if (paperFoldState==PaperFoldStateDefault)
#     {
#         [self.rootViewController viewWillAppear:YES];
#         [self.rootViewController viewDidAppear:YES];
        
#         if (self.rightViewController) {
#             [self.rightViewController viewWillDisappear:YES];
#             [self.rightViewController viewDidDisappear:YES];
#         }
        
#         if (self.leftViewController) {
#             [self.leftViewController viewWillDisappear:YES];
#             [self.leftViewController viewDidDisappear:YES];
#         }
#     }
#     else if (paperFoldState==PaperFoldStateLeftUnfolded)
#     {
#         [self.leftViewController viewWillAppear:YES];
#         [self.leftViewController viewDidAppear:YES];
        
#         [self.rootViewController viewWillDisappear:YES];
#         [self.rootViewController viewDidDisappear:YES];
#     }
#     else if (paperFoldState==PaperFoldStateRightUnfolded)
#     {
#         [self.rightViewController viewWillAppear:YES];
#         [self.rightViewController viewDidAppear:YES];
        
#         [self.rootViewController viewWillDisappear:YES];
#         [self.rootViewController viewDidDisappear:YES];
#     }
# }

end