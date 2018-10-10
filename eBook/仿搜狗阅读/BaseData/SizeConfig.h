//
//  SizeConfig.h
//  ifangchou
//
//  Created by Rich on 15/11/24.
//  Copyright © 2015年 ifangchou. All rights reserved.
//

#ifndef FCSizeConfig_h
#define FCSizeConfig_h


//size
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define OnePX 1.0f/[UIScreen mainScreen].scale
#define appDelegate ((AppDelegate*)[UIApplication sharedApplication].delegate)
#define appWindow appDelegate.window
#define AppMainNavi appDelegate.na_main
#define TabBarHeight appDelegate.tabBarController.tabBar.height;
#define myTabBarHeight appDelegate.tabBarController.tabBar.height
//#define TabBarHeight ((RCTabBarController*)[[UIApplication sharedApplication].delegate window].rootViewController).tabBar.size.height

#define tabBarHeight self.tabBarController.tabBar.height
#define navgatHeight self.navigationController.navigationBar.height
#define statusHeight [[UIApplication sharedApplication] statusBarFrame].size.height


#define dis_LEFTSCREEN 9
#define dis_RIGHTSCREEN 9
#define dis_TOP 15

//#define right_Dis 10
//#define left_Dis 10
//#define top_Dis 10
//#define bottom_Dis 10


#endif /* FCSizeConfig_h */
