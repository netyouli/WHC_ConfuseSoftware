//
//  UITableViewCell+WHC_AutoHeightForCell.m
//  Github <https://github.com/netyouli/WHC_AutoLayoutKit>
//
//  Created by 吴海超 on 16/2/17.
//  Copyright © 2016年 吴海超. All rights reserved.
//

//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "UITableViewCell+WHC_AutoHeightForCell.h"

#if TARGET_OS_IPHONE || TARGET_OS_TV
#import <objc/runtime.h>
#import "UIView+WHC_AutoLayout.h"

@interface UITableView (WHC_CacheCellHeight)
@end

@implementation UITableView (WHC_CacheCellHeight)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method reloadData = class_getInstanceMethod(self, @selector(reloadData));
        Method whc_ReloadData = class_getInstanceMethod(self, @selector(whc_ReloadData));
        Method reloadDataRow = class_getInstanceMethod(self, @selector(reloadRowsAtIndexPaths:withRowAnimation:));
        Method whc_ReloadDataRow = class_getInstanceMethod(self, @selector(whc_reloadRowsAtIndexPaths:withRowAnimation:));
        Method sectionReloadData = class_getInstanceMethod(self, @selector(reloadSections:withRowAnimation:));
        Method whc_SectionReloadData = class_getInstanceMethod(self, @selector(whc_ReloadSetion:withRowAnimation:));
        Method deleteCell = class_getInstanceMethod(self, @selector(deleteItemsAtIndexPaths:));
        Method whc_deleteCell = class_getInstanceMethod(self, @selector(whc_deleteItemsAtIndexPaths:));
        Method deleteSection = class_getInstanceMethod(self, @selector(deleteSections:));
        Method whc_deleteSection = class_getInstanceMethod(self, @selector(whc_deleteSections:));
        Method moveSection = class_getInstanceMethod(self, @selector(moveSection:toSection:));
        Method whc_moveSection = class_getInstanceMethod(self, @selector(whc_MoveSection:toSection:));
        Method moveRowAtIndexPath = class_getInstanceMethod(self, @selector(moveRowAtIndexPath:toIndexPath:));
        Method whc_moveRowAtIndexPath = class_getInstanceMethod(self, @selector(whc_MoveRowAtIndexPath:toIndexPath:));
        Method insertSections = class_getInstanceMethod(self, @selector(insertSections:withRowAnimation:));
        Method whc_insertSections = class_getInstanceMethod(self, @selector(whc_InsertSections:withRowAnimation:));
        Method insertRowsAtIndexPaths = class_getInstanceMethod(self, @selector(insertRowsAtIndexPaths:withRowAnimation:));
        Method whc_insertRowsAtIndexPaths = class_getInstanceMethod(self, @selector(whc_InsertRowsAtIndexPaths:withRowAnimation:));
        
        method_exchangeImplementations(sectionReloadData, whc_SectionReloadData);
        method_exchangeImplementations(reloadDataRow, whc_ReloadDataRow);
        method_exchangeImplementations(reloadData, whc_ReloadData);
        method_exchangeImplementations(deleteCell, whc_deleteCell);
        method_exchangeImplementations(deleteSection, whc_deleteSection);
        method_exchangeImplementations(moveSection, whc_moveSection);
        method_exchangeImplementations(moveRowAtIndexPath, whc_moveRowAtIndexPath);
        method_exchangeImplementations(insertSections, whc_insertSections);
        method_exchangeImplementations(insertRowsAtIndexPaths, whc_insertRowsAtIndexPaths);
    });
}

- (void)setWhc_CacheHeightDictionary:(NSMutableDictionary *)whc_CacheHeightDictionary {
    objc_setAssociatedObject(self,
                             @selector(whc_CacheHeightDictionary),
                             whc_CacheHeightDictionary,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)whc_CacheHeightDictionary {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)handleCacheHeightDictionary {
    if (self.whc_CacheHeightDictionary) {
        NSArray<NSString *> * allKey = [self.whc_CacheHeightDictionary.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString * obj1, NSString * obj2) {
            return obj1.floatValue < obj2.floatValue;
        }];
        __block NSString * frontKey = nil;
        __block NSInteger  index = 0;
        [allKey enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            if (frontKey == nil) {
                frontKey = key;
            }else {
                if (key.integerValue - frontKey.integerValue > 1) {
                    if (index == 0) {
                        index = frontKey.integerValue;
                    }
                    [self.whc_CacheHeightDictionary setObject:self.whc_CacheHeightDictionary[key] forKey:@(allKey[index].integerValue + 1).stringValue];
                    [self.whc_CacheHeightDictionary removeObjectForKey:key];
                    index = idx;
                }
                frontKey = key;
            }
        }];
    }
}

- (void)whc_deleteSections:(NSIndexSet *)sections {
    if (sections && self.whc_CacheHeightDictionary) {
        [sections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            [self.whc_CacheHeightDictionary removeObjectForKey:@(idx).stringValue];
        }];
        [self handleCacheHeightDictionary];
    }
    [self whc_deleteSections:sections];
}

- (void)whc_deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    if (indexPaths && self.whc_CacheHeightDictionary) {
        [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull indexPath, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString * cacheHeightKey = @(indexPath.section).stringValue;
            NSMutableDictionary * sectionCacheHeightDictionary = self.whc_CacheHeightDictionary[cacheHeightKey];
            if (sectionCacheHeightDictionary != nil) {
                [sectionCacheHeightDictionary removeObjectForKey:@(indexPath.row).stringValue];
            }
        }];
    }
    [self whc_deleteItemsAtIndexPaths:indexPaths];
}

- (void)whc_ReloadSetion:(NSIndexSet *)sections
        withRowAnimation:(UITableViewRowAnimation)animation {
    if (sections && self.whc_CacheHeightDictionary) {
        [sections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            [self.whc_CacheHeightDictionary removeObjectForKey:@(idx).stringValue];
        }];
        [self handleCacheHeightDictionary];
    }
    [self whc_ReloadSetion:sections withRowAnimation:animation];
}

- (void)whc_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    if (indexPaths && self.whc_CacheHeightDictionary) {
        [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull indexPath, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString * cacheHeightKey = @(indexPath.section).stringValue;
            NSMutableDictionary * sectionCacheHeightDictionary = self.whc_CacheHeightDictionary[cacheHeightKey];
            if (sectionCacheHeightDictionary != nil) {
                [sectionCacheHeightDictionary removeObjectForKey:@(indexPath.row).stringValue];
            }
        }];
    }
    [self whc_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)whc_ReloadData {
    if (self.whc_CacheHeightDictionary != nil) {
        [self.whc_CacheHeightDictionary removeAllObjects];
    }
    [self whc_ReloadData];
}

- (void)whc_MoveSection:(NSInteger)section toSection:(NSInteger)newSection {
    if (self.whc_CacheHeightDictionary) {
        NSMutableDictionary * sectionMap = [NSMutableDictionary dictionaryWithDictionary:self.whc_CacheHeightDictionary[@(section).stringValue]];
        self.whc_CacheHeightDictionary[@(section).stringValue] = self.whc_CacheHeightDictionary[@(newSection).stringValue];
        self.whc_CacheHeightDictionary[@(newSection).stringValue] = sectionMap;
    }
    [self whc_MoveSection:section toSection:newSection];
}

- (void)whc_MoveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath {
    if (indexPath && newIndexPath && self.whc_CacheHeightDictionary) {
        NSMutableDictionary * indexPathMap = self.whc_CacheHeightDictionary[@(indexPath.section).stringValue];
        CGFloat indexPathHeight = [indexPathMap[@(indexPath.row).stringValue] floatValue];
        
        NSMutableDictionary * newIndexPathMap = self.whc_CacheHeightDictionary[@(newIndexPath.section).stringValue];
        CGFloat newIndexPathHeight = [newIndexPathMap[@(newIndexPath.row).stringValue] floatValue];
        
        indexPathMap[@(indexPath.row).stringValue] = @(newIndexPathHeight);
        newIndexPathMap[@(newIndexPath.row).stringValue] = @(indexPathHeight);
    }
    [self whc_MoveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
}

- (void)whc_InsertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    if (sections && self.whc_CacheHeightDictionary) {
        NSUInteger firstSection = sections.firstIndex;
        NSUInteger moveSection = self.whc_CacheHeightDictionary.count;
        if (moveSection > firstSection) {
            for (NSInteger section = firstSection; section < moveSection; section++) {
                NSMutableDictionary * sectionMap = self.whc_CacheHeightDictionary[@(section).stringValue];
                if (sectionMap != nil) {
                    self.whc_CacheHeightDictionary[@(section + sections.count).stringValue] = sectionMap;
                    [self.whc_CacheHeightDictionary removeObjectForKey:@(section)];
                }
            }
        }
    }
    [self whc_InsertSections:sections withRowAnimation:animation];
}

- (void)whc_InsertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    if (self.whc_CacheHeightDictionary && indexPaths) {
        [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull indexPath, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableDictionary * sectionMap = self.whc_CacheHeightDictionary[@(indexPath.section).stringValue];
            if (sectionMap != nil) {
                NSInteger moveRow = sectionMap.count;
                if (moveRow > indexPath.row) {
                    for (NSInteger index = indexPath.row; index < moveRow; index++) {
                        id heightObject = sectionMap[@(index).stringValue];
                        if (heightObject) {
                            sectionMap[@(index + 1).stringValue] = @([heightObject floatValue]);
                            [sectionMap removeObjectForKey:@(index).stringValue];
                        }
                    }
                }
            }
        }];
    }
    [self whc_InsertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

@end



@implementation UITableViewCell (WHC_AutoHeightForCell)

- (void)setWhc_CellBottomOffset:(CGFloat)whc_CellBottomOffset {
    objc_setAssociatedObject(self,
                             @selector(whc_CellBottomOffset),
                             @(whc_CellBottomOffset),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)whc_CellBottomOffset {
    id bottomOffset = objc_getAssociatedObject(self, _cmd);
    return bottomOffset != nil ? [bottomOffset floatValue] : 0;
}

- (void)setWhc_CellBottomViews:(NSArray *)whc_CellBottomViews {
    objc_setAssociatedObject(self,
                             @selector(whc_CellBottomViews),
                             whc_CellBottomViews,
                             OBJC_ASSOCIATION_COPY);
}

- (NSArray *)whc_CellBottomViews {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWhc_CellBottomView:(UIView *)whc_CellBottomView {
    objc_setAssociatedObject(self,
                             @selector(whc_CellBottomView),
                             whc_CellBottomView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)whc_CellBottomView {
    return objc_getAssociatedObject(self, _cmd);
}

- (UITableView *)whc_CellTableView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWhc_CellTableView:(UITableView *)whc_CellTableView {
    objc_setAssociatedObject(self,
                             @selector(whc_CellTableView),
                             whc_CellTableView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)whc_TableViewWidth {
    id value = objc_getAssociatedObject(self, _cmd);
    return value != nil ? [value floatValue] : 0;
}

- (void)setWhc_TableViewWidth:(CGFloat)whc_TableViewWidth {
    objc_setAssociatedObject(self, @selector(whc_TableViewWidth), @(whc_TableViewWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (CGFloat)whc_CellHeightForIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView identifier:(NSString *)identifier layoutBlock:(void (^)(UITableViewCell * cell))block {
    if (tableView.whc_CacheHeightDictionary == nil) {
        tableView.whc_CacheHeightDictionary = [NSMutableDictionary dictionary];
    }
    NSString * cacheHeightKey = @(indexPath.section).stringValue;
    NSMutableDictionary * sectionCacheHeightDictionary = tableView.whc_CacheHeightDictionary[cacheHeightKey];
    if (sectionCacheHeightDictionary != nil) {
        NSNumber * cellHeight = sectionCacheHeightDictionary[@(indexPath.row).stringValue];
        if (cellHeight) {
            return cellHeight.floatValue;
        }
    }else {
        sectionCacheHeightDictionary = [NSMutableDictionary dictionary];
        [tableView.whc_CacheHeightDictionary setObject:sectionCacheHeightDictionary forKey:cacheHeightKey];
    }
    UITableViewCell * cell = nil;
    if (identifier && identifier.length > 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (block) {
            block(cell);
        }
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        }
    }else {
        cell = [tableView.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    if (cell.whc_CellTableView) {
        [cell.whc_CellTableView whc_Height:cell.whc_CellTableView.contentSize.height];
    }
    CGFloat tableViewWidth = cell.whc_TableViewWidth;
    if (tableViewWidth == 0) {
        [tableView layoutIfNeeded];
        tableViewWidth = CGRectGetWidth(tableView.frame);
    }
    if (tableViewWidth == 0) return 0;
    CGRect cellFrame = cell.frame;
    cellFrame.size.width = tableViewWidth;
    cell.frame = cellFrame;
    CGRect contentFrame = cell.contentView.frame;
    contentFrame.size.width = tableViewWidth;
    cell.contentView.frame = contentFrame;
    [cell layoutIfNeeded];
    UIView * bottomView = nil;
    if (cell.whc_CellBottomView != nil) {
        bottomView = cell.whc_CellBottomView;
    }else if(cell.whc_CellBottomViews != nil && cell.whc_CellBottomViews.count > 0) {
        bottomView = cell.whc_CellBottomViews[0];
        for (int i = 1; i < cell.whc_CellBottomViews.count; i++) {
            UIView * view = cell.whc_CellBottomViews[i];
            if (CGRectGetMaxY(bottomView.frame) < CGRectGetMaxY(view.frame)) {
                bottomView = view;
            }
        }
    }else {
        NSArray * cellSubViews = cell.contentView.subviews;
        if (cellSubViews.count > 0) {
            bottomView = cellSubViews[0];
            for (int i = 1; i < cellSubViews.count; i++) {
                UIView * view = cellSubViews[i];
                if (CGRectGetMaxY(bottomView.frame) < CGRectGetMaxY(view.frame)) {
                    bottomView = view;
                }
            }
        }else {
            bottomView = cell.contentView;
        }
    }
    
    CGFloat cacheHeight = CGRectGetMaxY(bottomView.frame) + cell.whc_CellBottomOffset;
    [sectionCacheHeightDictionary setValue:@(cacheHeight) forKey:@(indexPath.row).stringValue];
    return cacheHeight;
}

+ (CGFloat)whc_CellHeightForIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    if (tableView.whc_CacheHeightDictionary == nil) {
        tableView.whc_CacheHeightDictionary = [NSMutableDictionary dictionary];
    }
    NSString * cacheHeightKey = @(indexPath.section).stringValue;
    NSMutableDictionary * sectionCacheHeightDictionary = tableView.whc_CacheHeightDictionary[cacheHeightKey];
    if (sectionCacheHeightDictionary != nil) {
        NSNumber * cellHeight = sectionCacheHeightDictionary[@(indexPath.row).stringValue];
        if (cellHeight) {
            return cellHeight.floatValue;
        }
    }else {
        sectionCacheHeightDictionary = [NSMutableDictionary dictionary];
        [tableView.whc_CacheHeightDictionary setObject:sectionCacheHeightDictionary forKey:cacheHeightKey];
    }
    UITableViewCell * cell = [tableView.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    if (cell.whc_CellTableView) {
        [cell.whc_CellTableView whc_Height:cell.whc_CellTableView.contentSize.height];
    }
    CGFloat tableViewWidth = cell.whc_TableViewWidth;
    if (tableViewWidth == 0) {
        [tableView layoutIfNeeded];
        tableViewWidth = CGRectGetWidth(tableView.frame);
    }
    if (tableViewWidth == 0) return 0;
    CGRect cellFrame = cell.frame;
    cellFrame.size.width = tableViewWidth;
    cell.frame = cellFrame;
    CGRect contentFrame = cell.contentView.frame;
    contentFrame.size.width = tableViewWidth;
    cell.contentView.frame = contentFrame;
    [cell layoutIfNeeded];
    UIView * bottomView = nil;
    if (cell.whc_CellBottomView != nil) {
        bottomView = cell.whc_CellBottomView;
    }else if(cell.whc_CellBottomViews != nil && cell.whc_CellBottomViews.count > 0) {
        bottomView = cell.whc_CellBottomViews[0];
        for (int i = 1; i < cell.whc_CellBottomViews.count; i++) {
            UIView * view = cell.whc_CellBottomViews[i];
            if (CGRectGetMaxY(bottomView.frame) < CGRectGetMaxY(view.frame)) {
                bottomView = view;
            }
        }
    }else {
        NSArray * cellSubViews = cell.contentView.subviews;
        if (cellSubViews.count > 0) {
            bottomView = cellSubViews[0];
            for (int i = 1; i < cellSubViews.count; i++) {
                UIView * view = cellSubViews[i];
                if (CGRectGetMaxY(bottomView.frame) < CGRectGetMaxY(view.frame)) {
                    bottomView = view;
                }
            }
        }else {
            bottomView = cell.contentView;
        }
    }
    
    CGFloat cacheHeight = CGRectGetMaxY(bottomView.frame) + cell.whc_CellBottomOffset;
    [sectionCacheHeightDictionary setValue:@(cacheHeight) forKey:@(indexPath.row).stringValue];
    return cacheHeight;
}

@end
#endif
