
class TheController < UIViewController

  def loadView
    super
    # self.view = TheController.alloc.init

    paper_fold = PaperView.alloc.initWithFrame(CGRectMake(0,0,100,self.view.bounds.size.height))
    view.addSubview(paper_fold)

    # center = CenterController.alloc.initWithFrame([0,0,self.view.bounds.size.width,self.view.bounds.size.height])
    # view.addSubview(center)
  end

end
