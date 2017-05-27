//
//  DLAVAlertViewButtonTheme.m
//  DLAVAlertView
//
//  Created by Vincent Esche on 31/10/13.
//  Copyright (c) 2013 Vincent Esche. All rights reserved.
//

#import "DLAVAlertViewButtonTheme.h"
#import "ToolFontFit.h"
@interface DLAVAlertViewButtonTheme ()

@end

@implementation DLAVAlertViewButtonTheme

#pragma mark - Initialization

- (id)init {
	self = [super init];
	if (self) {
		self.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeTitle];
		//self.textColor = [UIColor colorWithHue:0.61 saturation:0.92 brightness:0.97 alpha:1.0];
        //self.textColor = [UIColor colorWithHue:27/255.0 saturation:173/255.0 brightness:196/255.0 alpha:1.0];
        //self.textColor = [UIColor colorWithRed:27/255.0 green:173/255.0  blue:196/255.0 alpha:1.0];
        self.backgroundColor = [UIColor colorWithRed:27/255.0 green:173/255.0  blue:196/255.0 alpha:1.0];
        self.textColor = [UIColor whiteColor];

		self.highlightBackgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
		self.height = 44.0;
		
		_textShadowColor = [UIColor clearColor];
		_textShadowOpacity = 0.0;
		_textShadowRadius = 0.0;
		_textShadowOffset = CGSizeMake(0.0, 0.0);
	}
	return self;
}

#pragma mark - NSCopying Protocol

- (instancetype)copyWithZone:(NSZone *)zone {
	DLAVAlertViewButtonTheme *copy = [super copyWithZone:zone];
	if (copy) {
		copy.textShadowColor = self.textShadowColor;
		copy.textShadowOpacity = self.textShadowOpacity;
		copy.textShadowRadius = self.textShadowRadius;
		copy.textShadowOffset = self.textShadowOffset;
	}
	return copy;
}

@end
