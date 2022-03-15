#import "ViewController.h"
#import "KWGobangView.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *maskView;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *stopButton;

@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) KWGobangView *gobangView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gobangView = [[KWGobangView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width)];
    [self.view addSubview:self.gobangView];
    
//    NSLog(@"the width is %f", self.gobangView.frame.size.width);
//    
//    UIButton *resetButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100) / 2, self.gobangView.frame.size.height + self.gobangView.frame.origin.y + 10, 100, 40)];
//    [resetButton setTitle:@"重来" forState:UIControlStateNormal];
//    [resetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [resetButton addTarget:self action:@selector(resetButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:resetButton];
    
    self.maskView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.maskView];
    self.maskView.image = [UIImage imageNamed:@"launch"];
    self.maskView.contentMode = UIViewContentModeScaleAspectFill;
    self.maskView.userInteractionEnabled = YES;
    
    self.startButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 475, 86, 25)];
    [self.maskView addSubview:self.startButton];
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"start"] forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(startButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.stopButton = [[UIButton alloc] initWithFrame:CGRectMake(166, 475, 86, 25)];
    [self.stopButton setBackgroundImage:[UIImage imageNamed:@"stop"] forState:UIControlStateNormal];
    [self.maskView addSubview:self.stopButton];
}

- (void)resetButtonPressed:(UIButton *)button {
    
    [self.gobangView reset];
}

- (void)startButtonPressed:(UIButton *)button {
    
    [self.maskView removeFromSuperview];
}

@end
