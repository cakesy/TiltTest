//
//  map2.h
//  UKPostCodes
//
//  Created by John Lyons on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Engine.h"
#import <CoreMotion/CoreMotion.h>
#import <QuartzCore/QuartzCore.h>

@interface map2 : UIViewController <UIPopoverControllerDelegate ,MKMapViewDelegate>{
	int width,height;
    
    Engine* myEngine;
    
    CMMotionManager* motionManager;
    CADisplayLink* motionDisplayLink;
    
    
    double oldyaw,oldpit;
    
    UIImageView* imagey;
	
}
@property (nonatomic, readwrite, retain) NSString *url;
@end
