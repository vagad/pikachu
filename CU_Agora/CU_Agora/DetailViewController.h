//
//  DetailViewController.h
//  CU_Agora
//
//  Created by Vamsi Gadiraju on 10/2/15.
//  Copyright (c) 2015 Vamsi Gadiraju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

