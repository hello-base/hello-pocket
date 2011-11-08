//
//  HPArtistListCell.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/8/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPArtistListCell.h"

#import "Artist.h"

@implementation HPArtistListCell

@synthesize artist = _artist;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }

    self.textLabel.backgroundColor = self.backgroundColor;
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.numberOfLines = 2;

    self.detailTextLabel.backgroundColor = self.backgroundColor;
    self.detailTextLabel.textColor = [UIColor grayColor];

    self.imageView.backgroundColor = self.backgroundColor;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;

    self.selectionStyle = UITableViewCellSelectionStyleGray;

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setArtist:(Artist *)artist
{
    self.textLabel.text = artist.name;
    self.detailTextLabel.text = artist.kanji;
}

- (void)prepareForReuse
{
    self.textLabel.text = nil;
    self.detailTextLabel.text = nil;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGRect imageViewFrame = self.imageView.frame;
    CGRect textLabelFrame = self.textLabel.frame;
    CGRect detailTextLabelFrame = self.detailTextLabel.frame;

    imageViewFrame.origin = CGPointMake(10.0f, 10.0f);
    imageViewFrame.size = CGSizeMake(50.0f, 50.0f);
    textLabelFrame.origin.x = imageViewFrame.size.width + 25.0f;
    detailTextLabelFrame.origin.x = textLabelFrame.origin.x;
    textLabelFrame.size.width = 240.0f;
    detailTextLabelFrame.size.width = textLabelFrame.size.width;

    self.textLabel.frame = textLabelFrame;
    self.detailTextLabel.frame = detailTextLabelFrame;
    self.imageView.frame = imageViewFrame;
}

@end
