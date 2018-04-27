//
//  BookView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "BookTableViewCell.h"

@implementation BookTableViewCell {
    UIImageView *bookImageView;
    UILabel *bookNameLabel;
    UILabel *bookCategoryLabel;
    UILabel *bookStatusLabel;
    UILabel *bookWriterLabel;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        bookImageView = [UIImageView new];
        bookNameLabel = [UILabel new];
        bookCategoryLabel = [UILabel new];
        bookStatusLabel = [UILabel new];
        bookWriterLabel = [UILabel new];
        _readBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _downloadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [self.contentView addSubview:bookImageView];
        [self.contentView addSubview:bookNameLabel];
        [self.contentView addSubview:bookCategoryLabel];
        [self.contentView addSubview:bookStatusLabel];
        [self.contentView addSubview:bookWriterLabel];
        [self.contentView addSubview:_readBtn];
        [self.contentView addSubview:_downloadBtn];
        
        [bookImageView setImage:[UIImage imageNamed:@"banner"]];
        
        bookNameLabel.text = @"历史的教训";
        bookNameLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:19];
        bookNameLabel.textColor = [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1/1.0];
        
        bookWriterLabel.text = @"作者：包刚升";
        bookWriterLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        bookWriterLabel.textColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1/1.0];
        
        bookCategoryLabel.text = @"分类：历史";
        bookCategoryLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        bookCategoryLabel.textColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1/1.0];
        
        bookStatusLabel.text = @"状态：已完结";
        bookStatusLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        bookStatusLabel.textColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1/1.0];
        
        
        [_readBtn setImage:[UIImage imageNamed:@"read"] forState:UIControlStateNormal];
        [_readBtn setTitle:@"马上阅读" forState:UIControlStateNormal];
        [_readBtn setTitleColor:rgb(74,144,226) forState:UIControlStateNormal];
        
        [_downloadBtn setImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
        [_downloadBtn setTitle:@"立即下载" forState:UIControlStateNormal];
        [_downloadBtn setTitleColor:rgb(74,144,226) forState:UIControlStateNormal];
        
        
        [bookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(20);
            make.width.mas_equalTo(82);
            make.height.mas_equalTo(110);
        }];
        
        [bookNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->bookImageView.mas_right).offset(20);
            make.top.equalTo(self.contentView).offset(20);
            make.right.equalTo(self.contentView).offset(-20);
            make.height.mas_equalTo(26);
        }];
        
        [bookWriterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->bookNameLabel.mas_bottom).offset(9);
            make.left.equalTo(self->bookNameLabel);
            make.right.equalTo(self.contentView).offset(-20);
            make.height.mas_equalTo(18);
        }];
        
        [bookCategoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->bookNameLabel);
            make.top.equalTo(self->bookWriterLabel.mas_bottom).offset(5);
            make.right.equalTo(self.contentView).offset(-20);
            make.height.mas_equalTo(18);
        }];
        
        [bookStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->bookNameLabel);
            make.top.equalTo(self->bookCategoryLabel.mas_bottom).offset(5);
            make.right.equalTo(self.contentView).offset(-20);
            make.height.mas_equalTo(18);
        }];
        
        [_readBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self->bookImageView.mas_bottom).offset(15);
            //        make.top.equalTo(self->bookStatusLabel.mas_bottom).offset(27);
            make.width.equalTo(self->_downloadBtn);
            make.height.mas_equalTo(50);
            make.bottom.equalTo(self.contentView);
        }];
        
        [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(50);
            make.left.equalTo(self->_readBtn.mas_right);
            make.right.equalTo(self.contentView).offset(-15);
            make.bottom.top.equalTo(self->_readBtn);
        }];
        
    }
    return self;
}

-(void)setBookModel:(BookModel *)bookModel {
    if (_bookModel != bookModel) {
        
        _bookModel = bookModel;
        [bookImageView setImage:_bookModel.bookImage];
        [bookWriterLabel setText:[NSString stringWithFormat:@"作者：%@",_bookModel.bookWriter]];
        [bookCategoryLabel setText:[NSString stringWithFormat:@"分类：%@",_bookModel.bookCategory]];
        [bookStatusLabel setText:[NSString stringWithFormat:@"状态：%@",_bookModel.bookStatus]];
        [bookNameLabel setText:_bookModel.bookName];
        
    }
}

@end





























