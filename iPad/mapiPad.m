    //
//  mapiPad.m
//  instantMaps
//
//  Created by John Lyons on 13/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "mapiPad.h"


@implementation mapiPad

@synthesize url;


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
		
    myEngine=[Engine sharedInstance];
	
	
	UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	contentView.autoresizingMask=(UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
	contentView.autoresizesSubviews=YES;
    contentView.backgroundColor=[UIColor blackColor];
	self.view = contentView;
    [contentView release];
    
    
    
    motionManager = [[CMMotionManager alloc] init];
    motionManager.deviceMotionUpdateInterval = 0.02;  // 50 Hz
    
    
    motionDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(motionRefresh:)];
    [motionDisplayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    if ([motionManager isDeviceMotionAvailable]) {
        [motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXArbitraryZVertical];
    }
    
    imagey=[[UIImageView alloc] initWithFrame:CGRectMake((768-1224)/2,(1024-918)/2,1224,918)];
    imagey.image=[UIImage imageNamed:@"spacey.jpg"];
    [self.view addSubview:imagey];
    
    
    UILabel* status = [[UILabel alloc] initWithFrame:CGRectMake(10,10,400,40)];
	status.font=[UIFont fontWithName:@"Verdana" size:30];
	status.text=@"iOs7 preview tilt";
    status.tag=131;
	status.textColor = [UIColor whiteColor];
	status.backgroundColor= [UIColor clearColor];
	status.textAlignment=UITextAlignmentCenter;
	[self.view addSubview:status];
	[status release];
		
}
- (void)motionRefresh:(id)sender {
    //CMQuaternion quat = motionManager.deviceMotion.attitude.quaternion;
    //double yaw = asin(2*(quat.x*quat.z - quat.w*quat.y));
    
    double yaw = motionManager.deviceMotion.attitude.pitch;
    double tilt = motionManager.deviceMotion.attitude.roll;
    
    // use the yaw value
    // ...
    
    if (yaw-oldyaw>0.001f || tilt-oldpit>0.001f){
        //NSLog(@"yaw %1.2f %1.2f",yaw-oldyaw,tilt-oldpit);
    }
    
    float delta=(-yaw+oldyaw)*100.0f,gamma=(-tilt+oldpit)*100.0f;
    //float delta=(yaw-oldyaw)*100.0f,gamma=(tilt-oldpit)*100.0f;
    
    imagey.frame=CGRectMake(imagey.frame.origin.x+gamma,imagey.frame.origin.y+delta,imagey.frame.size.width,imagey.frame.size.height);
    
    oldyaw=yaw;oldpit=tilt;
}
- (void)viewDidAppear:(BOOL)animated{
	
	
	
}

-(void)viewWillAppear:(BOOL)animated{
	
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
