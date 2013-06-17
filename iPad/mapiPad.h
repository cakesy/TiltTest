//
//  mapiPad.h
//  instantMaps
//
//  Created by John Lyons on 13/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Engine.h"
#import <CoreMotion/CoreMotion.h>
#import <QuartzCore/QuartzCore.h>

@interface mapiPad : UIViewController <UIPopoverControllerDelegate ,MKMapViewDelegate>{
	int width,height;
    
    Engine* myEngine;
    
    CMMotionManager* motionManager;
    CADisplayLink* motionDisplayLink;
    
    
    double oldyaw,oldpit;
    
    UIImageView* imagey;
	
}
@property (nonatomic, readwrite, retain) NSString *url;
@end
