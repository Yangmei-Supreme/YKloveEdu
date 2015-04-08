//
//  PostTableViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/30.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "PostTableViewCell.h"
#import "postModel.h"

@implementation PostTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"post";
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"PostTableViewCell" bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setPost:(postModel *)post
{
    _post = post;
    self.secTitleLabel.text = post.topicSecTitle;
    self.timeLabel.text = post.topicTime;
    self.countLabel.text = [NSString stringWithFormat:@"%ld",post.topicCommentnum];
}

@end
