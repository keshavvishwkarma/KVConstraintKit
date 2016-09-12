//
//  KVConstraintKitProtocol.swift
//  KVConstraintKit
//
//  Created by Keshav on 9/10/16.
//  Copyright © 2016 Keshav. All rights reserved.
//

import Foundation

//********* Define LayoutGuidable protocol *********//

public protocol LayoutGuidable:class {
    /// TO ADD SINGLE CONSTRAINTS
    func +(lhs: Self, rhs: (View, LayoutGuideType)) -> NSLayoutConstraint
    
    /// TO REMOVE SINGLE CONSTRAINTS
    func -(lhs: Self, rhs: (View, LayoutGuideType))
    
    /// TO ACCESS CONSTRAINT BASED ON LAYOUT GUIDE TYPE
    func <-(lhs: Self, rhs: (View, LayoutGuideType)) -> NSLayoutConstraint?
}

//********* Define Addable protocol *********//

public protocol Addable:class {
    /// TO ADD SINGLE CONSTRAINTS
    func +(lhs: Self, rhs: NSLayoutConstraint)  -> NSLayoutConstraint
    
    /// TO ADD MULTIPLE CONSTRAINTS
    func +(lhs: Self, rhs: [NSLayoutConstraint])-> [NSLayoutConstraint]
    
    //func +(lhs: Self, rhs: [(NSLayoutAttribute, CGFloat)])-> [NSLayoutConstraint]
    
}

//********* Define Accessable protocol *********//

public protocol Accessable:class {
    /// TO ACCESS CONSTRAINT BASED ON LAYOUT ATTRIBUTE
    func <-(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint?
    
    // To Do -> Optiomise In Future
    func <-(lhs: Self, rhs: (NSLayoutAttribute, NSLayoutRelation)) -> NSLayoutConstraint?
}

//********* Define Removable protocol *********//

public protocol Removable:class {
    /// TO REMOVE SINGLE CONSTRAINTS
    func -(lhs: Self, rhs: NSLayoutConstraint)  -> NSLayoutConstraint
    
    /// TO REMOVE MULTIPLE CONSTRAINTS
    func -(lhs: Self, rhs: [NSLayoutConstraint])-> [NSLayoutConstraint]
}

//********* Define LayoutRelationable protocol *********//

public protocol LayoutRelationable:class {
    /// TO ADD SINGLE RELATION CONSTRAINT
    func +==(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint
    func +>=(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint
    func +<=(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint
    
    /// TO ADD MULTIPLE RELATION CONSTRAINT
    func +==(lhs: Self, rhs: [NSLayoutAttribute])
    func +>=(lhs: Self, rhs: [NSLayoutAttribute])
    func +<=(lhs: Self, rhs: [NSLayoutAttribute])
    
    /// TO ADD SINGLE RELATION CONSTRAINT WITH MULTIPLEIR
    func +*>=(lhs: Self, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint
    func +*==(lhs: Self, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint
    func +*<=(lhs: Self, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint
    
    /// TO ADD MULTIPLE RELATION CONSTRAINT WITH MULTIPLEIR
    func +*==(lhs: Self, rhs: [(NSLayoutAttribute, CGFloat)])
    func +*>=(lhs: Self, rhs: [(NSLayoutAttribute, CGFloat)])
    func +*<=(lhs: Self, rhs: [(NSLayoutAttribute, CGFloat)])
    
}
