//
//  AskNumView.h
//  Ask
//
//  Created by lee on 2018/12/20.
//  Copyright © 2018 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AskNumView : UIView

+ (AskNumView *)shared;

- (id)init;

/**显示*/
- (void)show;

@end

NS_ASSUME_NONNULL_END
