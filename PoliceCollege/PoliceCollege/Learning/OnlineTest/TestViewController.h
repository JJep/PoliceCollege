//
//  TestViewController.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/29.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController
@property (nonatomic,assign)NSUInteger testID;
@end


//function randomOption(q) {
//    var options = q.options.split(" ");
//    if(q.optionIndex){
//        var rNumList = q.optionIndex.split(",");
//        var op = "";
//        for ( var i = 0; i < rNumList.length; i++) {
//            var index = rNumList[i] - 1;
//            op += options[index] + " ";
//        }
//        q.options = $.trim(op);
//        q.answer = q.answerIndex;
//    }else{
//        if(testpaper.randomOption == 0){
//            q.options = q.options;
//            var oIndex = "";
//            for ( var i = 0; i < options.length; i++) {
//                if(i>0){
//                    oIndex += ",";
//                }
//                oIndex += (i+1);
//            }
//            q.optionIndex = oIndex;
//            q.answer = q.answer;
//        }else{
//            var answer = q.answer;
//            var rNumList = unRepeatRandomNumber(options.length, options.length);
//            var op = "";
//            var newAnswer = "";
//            for ( var i = 0; i < rNumList.length; i++) {
//                var index = rNumList[i] - 1;
//                if ((','+answer+',').indexOf(','+index+',') != -1) {
//                    if(newAnswer.length>0){
//                        newAnswer += ",";
//                    }
//                    newAnswer += i;
//                }
//                op += options[index] + " ";
//            }
//            q.options = $.trim(op);
//            q.optionIndex = rNumList.join(",");
//            q.answer = newAnswer;
//        }
//    }
//}

//function unRepeatRandomNumber(count, number) {
//    if (count < number) {
//        return null;
//    }
//    var randomList = [];
//    for ( var i = 0; i < number; i++) {
//        var random = Math.floor(Math.random() * count) + 1;
//        var rStr = "," + randomList.join(",") + ",";
//        if (rStr.indexOf("," + random + ",") == -1) {
//            randomList.push(random);
//        } else {
//            i--;
//        }
//    }
//    return randomList;
//}
