//
//  Engine.h
//  NFLNews
//
//  Created by John Lyons on 26/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Engine : NSObject {
	float board[10];  // c-style array
    
	NSMutableArray* saveGames,*ourMoves;
}
@property (nonatomic, readwrite, retain) NSMutableArray *saveGames,*ourMoves;

+ (Engine *) sharedInstance;

- (float) getFieldValueAtPos:(NSUInteger)x;
- (void) setFieldValueAtPos:(NSUInteger)x ToValue:(float)newVal;

@end
