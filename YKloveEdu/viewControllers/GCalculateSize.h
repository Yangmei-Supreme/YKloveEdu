//
//  ImageSize.h
//  test
//
//  Created by Golven on 15/4/2.
//  Copyright (c) 2015年 Gold. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GCalculateSize : NSObject
/**URL*/
+(CGSize)downloadImageSizeWithURL:(id)imageURL;
/**PNG*/
+(CGSize)downloadPNGImageSizeWithRequest:(NSMutableURLRequest*)request;
/**GIF*/
+(CGSize)downloadGIFImageSizeWithRequest:(NSMutableURLRequest*)request;
/**JPG*/
+(CGSize)downloadJPGImageSizeWithRequest:(NSMutableURLRequest*)request;
/**text*/
+(CGSize)calculateTextSize:(NSString *)textString font:(id)font contentWidth:(CGFloat)CWidth;
/**计算文本和图片的总高度*/
+(CGSize)calculateTotallyHeight:(id)images;
@end
