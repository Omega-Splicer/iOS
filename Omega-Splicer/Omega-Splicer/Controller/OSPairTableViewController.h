//
//  OSPairTableViewController.h
//  Omega-Splicer
//
//  Created by Charles Fournier on 02/05/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSBluetoothManager.h"

@interface OSPairTableViewController : UITableViewController <OSBluetoothManagerDelegate>

- (void)refresh:(id)sender;

@end
