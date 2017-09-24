class Controller < UIViewController
  def viewDidLoad
    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.setTitle('test', forState:UIControlStateNormal)
    button.addTarget(self, action:'blue', forControlEvents:UIControlEventTouchUpInside)
    button.frame = [[20, 260], [view.frame.size.width - 40, 40]]
    view.addSubview(button)
  end

  def blue
    puts "hello"
  end

end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = Controller.new
    @window.makeKeyAndVisible
    true
  end
end
