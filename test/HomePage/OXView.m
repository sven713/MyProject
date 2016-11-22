//
//  OXView.m
//  test
//
//  Created by sven on 16/11/20.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "OXView.h"

@implementation OXView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    
    return self;
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //No.1
    //开始写代码,触摸操作开始时,获取当前触摸位置的字符所属的单词。并用UIAlertView显示出来(提示：触摸位置需向下调整10个点，以便与文本元素对齐)
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:[touch view]];
               
//                          UITextView *textView = (UITextView *)recognizer.view;
//                          
//                          // Location of the tap in text-container coordinates
//                          
//                          NSLayoutManager *layoutManager = textView.layoutManager;
//                          CGPoint location = [recognizer locationInView:textView];
//                          location.x -= textView.textContainerInset.left;
//                          location.y -= textView.textContainerInset.top;
//                          
//                          // Find the character that's been tapped on
//                          
//                          NSUInteger characterIndex;
//                          characterIndex = [layoutManager characterIndexForPoint:location
//                                                                 inTextContainer:textView.textContainer
//                                        fractionOfDistanceBetweenInsertionPoints:NULL];
//                          
//                          if (characterIndex < textView.textStorage.length) {
//                              
//                              NSRange range;
//                              id value = [textView.attributedText attribute:@"myCustomTag" atIndex:characterIndex effectiveRange:&range];
//                              
//                              // Handle as required...
//                              
//                              NSLog(@"%@, %d, %d", value, range.location, range.length);
//                              
//                          }
//    
//  [self.layoutManager characterIndexForPoint:touchPoint inTextContainer:self.textContainer fractionOfDistanceBetweenInsertionPoints:NULL];
//                          
//                          
////                          NSInteger characterIndex = [self.layoutManager characterIndexForPoint:touchPoint inTextContainer:self.textContainer fractionOfDistanceBetweenInsertionPoints:NULL];
//                          if (characterIndex<self.text.length) {
//                              NSString *s=[self.text substringWithRange:NSMakeRange(characterIndex, 1)];
//                              NSLog(@"%@",s);
//                          }
    
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          //end_code
                          [super touchesBegan: touches withEvent: event];
                          }

@end
