//
//  Engine.m
//  NFLNews
//
//  Created by John Lyons on 26/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Engine.h"


@implementation Engine
static Engine *_sharedInstance;
@synthesize saveGames,ourMoves;

- (id) init
{
	if (self = [super init])
	{
		// custom initialization
		memset(board, 0, sizeof(board));
        
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString* documentsDirectory = [paths objectAtIndex:0];
		saveGames = [[NSMutableArray alloc] initWithContentsOfFile:
                     [documentsDirectory stringByAppendingString:@"/saveGames.plist"]];
        
        if ([saveGames count]==0){
            saveGames=[[NSMutableArray alloc] init];
        }
        
	}
	return self;
}

+ (Engine *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[Engine alloc] init];
	}
	
	return _sharedInstance;
}

- (float) getFieldValueAtPos:(NSUInteger)x
{
	return board[x];
}

- (void) setFieldValueAtPos:(NSUInteger)x ToValue:(float)newVal
{
	board[x] = newVal;
}

@end
