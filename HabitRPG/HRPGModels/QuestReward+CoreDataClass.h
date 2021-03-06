//
//  QuestReward+CoreDataClass.h
//  Habitica
//
//  Created by Phillip on 28.08.17.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Quest;

NS_ASSUME_NONNULL_BEGIN

@interface QuestReward : NSManagedObject

- (NSString *) getImageName;

@end

NS_ASSUME_NONNULL_END

#import "QuestReward+CoreDataProperties.h"
