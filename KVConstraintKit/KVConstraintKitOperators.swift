//
//  KVConstraintKitOperators.swift
//  KVConstraintKit
//
//  Created by Keshav on 8/16/16.
//  Copyright © 2016 Keshav. All rights reserved.
//

import Foundation

//********* DEFINE NEW OPERATOR *********//
infix operator +==  { }; infix operator  +>= { };  infix operator +<= { }
infix operator +*<= { }; infix operator +*== { }; infix operator +*>= { }

infix operator <- { };

infix operator <+==> { }; infix operator <+>=> { }; infix operator <+<=> { }


//********* DEFINE NEW INTERFACE *********//

public protocol LayoutGuidable:class {
    /// TO ADD SINGLE CONSTRAINTS
    func +(lhs: Self, rhs: (View, LayoutGuideType)) -> NSLayoutConstraint
    
    /// TO REMOVE SINGLE CONSTRAINTS
    func -(lhs: Self, rhs: (View, LayoutGuideType))
    
    /// TO ACCESS CONSTRAINT BASED ON LAYOUT GUIDE TYPE
    func <-(lhs: Self, rhs: (View, LayoutGuideType)) -> NSLayoutConstraint?
}

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


//Defining operators definations

extension View : LayoutRelationable { }

//MARK: LayoutRelationable

/// TO ADD SINGLE RELATION CONSTRAINT
//-----------------------------------------

/// (leftContainerView +== .Top).constant = 0
public func +<=(lhs: View, rhs: NSLayoutAttribute) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs, relation: .LessThanOrEqual)
}

/// (leftContainerView +== .Top).constant = 0
public func +==(lhs: View, rhs: NSLayoutAttribute) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs, constant: 0)
}

/// (leftContainerView +== .Top).constant = 0
public func +>=(lhs: View, rhs: NSLayoutAttribute) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs, relation: .GreaterThanOrEqual)
}

/// TO ADD MULTIPLE EQUAL RELATION CONSTRAINT
//----------------------------------------------

// With defualt constant toCGFloat that is - 0 (Zero) on a specific attribute
public func +<=(lhs: View, rhs: [NSLayoutAttribute]) {
    for attribute in rhs { lhs +<= attribute }
}

public func +==(lhs: View, rhs: [NSLayoutAttribute]) {
    for attribute in rhs { lhs +== attribute }
}

public func +>=(lhs: View, rhs: [NSLayoutAttribute]) {
    for attribute in rhs { lhs +>= attribute }
}

/// TO ADD SINGLE EQUAL RELATION CONSTRAINT WITH MULTIPLEIR
//-------------------------------------------------------------

public func +*>=(lhs: View, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs.0, relation: .GreaterThanOrEqual, multiplier: rhs.1)
}

/// (leftContainerView *== (.Top, multiplier) ).constant = 0
public func +*==(lhs: View, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs.0, multiplier: rhs.1)
}

public func +*<=(lhs: View, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs.0, relation: .LessThanOrEqual, multiplier: rhs.1)
}


/// TO ADD MULTIPLE RELATION CONSTRAINT WITH MULTIPLEIR
//-------------------------------------------------------------

public func +*<=(lhs: View, rhs: [(NSLayoutAttribute, CGFloat)]){
    for attribute in rhs { lhs +*<= attribute }
}

public func +*==(lhs: View, rhs: [(NSLayoutAttribute, CGFloat)]){
    for attribute in rhs { lhs +*== attribute }
}
public func +*>=(lhs: View, rhs: [(NSLayoutAttribute, CGFloat)]){
    for attribute in rhs { lhs +*>= attribute }
}

