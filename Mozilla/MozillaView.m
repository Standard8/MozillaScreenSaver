// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

#import "MozillaScene.h"
#import "MozillaView.h"

@interface MySKView: SKView {
}
@end

@implementation MySKView
-(BOOL)acceptsFirstResponder {
    return NO;
}
@end

#pragma mark -

@implementation MozillaView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    if (self = [super initWithFrame:frame isPreview:isPreview]) {
        self.sceneView = [[MySKView alloc] initWithFrame: self.frame];
        self.sceneView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        [self addSubview: self.sceneView];
        self.scene = [[MozillaScene alloc] initWithSize: self.frame.size isPreview: NO]; // TODO _isPreview?
        [self.sceneView presentScene: self.scene];
    }
    return self;
}

- (BOOL)hasConfigureSheet {
    return NO;
}

- (NSWindow*)configureSheet {
    return nil;
}

@end
