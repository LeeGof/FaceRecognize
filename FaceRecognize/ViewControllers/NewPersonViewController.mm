//
//  NewPersonViewController.mm
//  FaceRecognition
//
//  Created by Michael Peterson on 2012-11-16.
//
//

#import "NewPersonViewController.h"
#import "CustomFaceRecognizer.h"

@interface NewPersonViewController ()

@end

@implementation NewPersonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    // 返回按钮
    UIButton *btnReturn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 30)];
    [btnReturn setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btnReturn setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateHighlighted];
    [btnReturn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btnReturn.tag = 5000;
    UIBarButtonItem *barBtnReturn = [[UIBarButtonItem alloc] initWithCustomView:btnReturn];
    barBtnReturn.style=UIBarButtonItemStyleBordered;
    self.navigationItem.leftBarButtonItem = barBtnReturn;
    [btnReturn release];
    [barBtnReturn release];
}

- (void)btnClick:(id)sender
{
    UIButton *btnSender = (UIButton *)sender;
    switch (btnSender.tag)
    {
        case 5000:
        {
            [self.navigationController popViewControllerAnimated:YES];
            
            break;
        }
        default:
            break;
    }
}

- (IBAction)savePerson:(id)sender
{
    CustomFaceRecognizer *faceRecognizer = [[CustomFaceRecognizer alloc] init];
    [faceRecognizer newPersonWithName:self.nameField.text];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
