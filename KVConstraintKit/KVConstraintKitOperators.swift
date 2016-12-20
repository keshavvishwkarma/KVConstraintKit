//
//  KVConstraintKitOperators.swift
//  KVConstraintKit
//
//  Created by Keshav on 8/16/16.
//  Copyright © 2016 Keshav. All rights reserved.
//

import UIKit

//********* DEFINE NEW OPERATOR *********//
infix operator    ~ { }
infix operator   <- { }
infix operator  +== { }
infix operator  +>= { }
infix operator  +<= { }
infix operator +*<= { }
infix operator +*== { }
infix operator +*>= { }

infix operator <+==> { }
infix operator <+>=> { }
infix operator <+<=> { }

/**
 
 ### Relations
 
 Relations are expressed using the overloaded operators `==` (`NSLayoutRelation.Equal`), `>=` (`NSLayoutRelation.GreaterThanOrEqual`), and `<=` (`NSLayoutRelation.LessThanOrEqual`).
 The following types of operators are provided by KVConstraintKit, to add, remove, access and modify constraints.
 
 */

//Defining operators definations

// MARK: Addable
extension View : Addable { }

/// To add single constraint on the receiver view
public func +(lhs: View, rhs: NSLayoutConstraint) -> NSLayoutConstraint {
    return lhs.applyPreparedConstraintInView(constraint: rhs)
}

/// To add multiple constraints on the receiver view
public func +(lhs: View, rhs: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for c in rhs {
        constraints.append( lhs + c )
    }
    return constraints
}

// MARK: Removable
extension View : Removable { }

/// To remove single constraint from the receiver view
public func -(lhs: View, rhs: NSLayoutConstraint) -> NSLayoutConstraint {
    lhs.removeConstraint(rhs); return rhs
}

/// To remove multiple constraint from the receiver view
public func -(lhs: View, rhs: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
    if rhs.isEmpty {    return rhs     }
    lhs.removeConstraints(rhs); return rhs
}

// MARK: Accessable
extension View : Accessable { }

public func <-(lhs: View, rhs: NSLayoutAttribute) -> NSLayoutConstraint?{
    return lhs.accessAppliedConstraintBy(attribute: rhs)
}

public func <-(lhs: View, rhs: (NSLayoutAttribute, NSLayoutRelation)) -> NSLayoutConstraint?{
    return lhs.accessAppliedConstraintBy(attribute: rhs.0, relation: rhs.1)
}

// MARK: Modifiable
extension View :  Modifiable { }

/// (containerView ~ (constraint, multiplier))
public func *(lhs: View, rhs: (NSLayoutConstraint, CGFloat)) {
    (lhs ~ (rhs.0, rhs.0.modified(multiplier: rhs.1)))
}

/// (containerView ~ (constraint, multiplier))
public func ~(lhs: View, rhs: (NSLayoutConstraint, NSLayoutRelation)) {
    (lhs ~ (rhs.0, rhs.0.modified(relation: rhs.1)))
}

/// (containerView ~ (old, new))
public func ~(lhs: View, rhs: (NSLayoutConstraint, NSLayoutConstraint)) {
    // Remove old one
    rhs.0.isSelfConstraint() ? lhs - rhs.0 : lhs.superview! - rhs.0
    rhs.1.isSelfConstraint() ? lhs - rhs.1 : lhs.superview! - rhs.1
}

/// (containerView ~ (.Top, .Equal))
public func ~(lhs: View, rhs: (NSLayoutAttribute, UILayoutPriority)) {
    guard let constraint = (lhs <- rhs.0) else { return  }
    
    if constraint.isSelfConstraint() {
        lhs - constraint
        constraint.priority = rhs.1
        lhs + constraint
    } else {
        lhs.superview! - constraint
        constraint.priority = rhs.1
        lhs.superview! + constraint
    }
    
}

// MARK: LayoutRelationable
extension View : LayoutRelationable { }

/// TO ADD SINGLE RELATION CONSTRAINT
//-----------------------------------------
/// (containerView +== .Top).constant = 0

public func +<=(lhs: View, rhs: NSLayoutAttribute) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs, attribute: rhs, relation: .LessThanOrEqual)
}

public func +==(lhs: View, rhs: NSLayoutAttribute) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs, attribute: rhs)
}

public func +>=(lhs: View, rhs: NSLayoutAttribute) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs, attribute: rhs, relation: .GreaterThanOrEqual)
}

/// TO ADD MULTIPLE EQUAL RELATION CONSTRAINT
//----------------------------------------------
/// (containerView +== [.Top, Bottom, Leading, Trailing])

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
/// (containerView +== (.Top, 1.5)).constant = 0

public func +*>=(lhs: View, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs.0, attribute: rhs.0, relation: .GreaterThanOrEqual, multiplier: rhs.1)
}

/// (containerView +*== (.Top, multiplier) ).constant = 0
public func +*==(lhs: View, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs.0, attribute: rhs.0, multiplier: rhs.1)
}

public func +*<=(lhs: View, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs.0, attribute: rhs.0, relation: .LessThanOrEqual, multiplier: rhs.1)
}

/// TO ADD MULTIPLE RELATION CONSTRAINT WITH MULTIPLEIR
//-------------------------------------------------------------
/// (containerView +== [(.Height, 1.5), (.Width, 0.8)])

public func +*<=(lhs: View, rhs: [(NSLayoutAttribute, CGFloat)]){
    for attribute in rhs { lhs +*<= attribute }
}

public func +*==(lhs: View, rhs: [(NSLayoutAttribute, CGFloat)]){
    for attribute in rhs { lhs +*== attribute }
}

public func +*>=(lhs: View, rhs: [(NSLayoutAttribute, CGFloat)]){
    for attribute in rhs { lhs +*>= attribute }
}

/// TO ADD SIBLINGS RELATION CONSTRAINT
//-------------------------------------------------------------

public func <+<=>(lhs: View, rhs: (NSLayoutAttribute, NSLayoutAttribute, View, CGFloat)) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintFromSiblingView(attribute: rhs.0, toAttribute: rhs.1, ofView: rhs.2, relation:.LessThanOrEqual, multiplier: rhs.3)
}

public func <+==>(lhs: View, rhs: (NSLayoutAttribute, NSLayoutAttribute, View, CGFloat)) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintFromSiblingView(attribute: rhs.0, toAttribute: rhs.1, ofView: rhs.2, multiplier: rhs.3)
}

public func <+>=>(lhs: View, rhs: (NSLayoutAttribute, NSLayoutAttribute, View, CGFloat)) -> NSLayoutConstraint {
    return lhs.superview! + lhs.prepareConstraintFromSiblingView(attribute: rhs.0, toAttribute: rhs.1, ofView: rhs.2, relation:.GreaterThanOrEqual, multiplier: rhs.3)
}

/// TO ADD SelfAddable CONSTRAINT
//-------------------------------------------------------------

extension View : SelfAddable { }

public func +<=(lhs: View, rhs: (SelfAttribute, CGFloat)){
    if rhs.0 == .AspectRatio {
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, relation:.LessThanOrEqual, secondView:lhs, attribute:rhs.0.attribute().1, constant:rhs.1)
    }else{
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, relation:.LessThanOrEqual, attribute:rhs.0.attribute().1, constant:rhs.1)
    }
}

public func +==(lhs: View, rhs: (SelfAttribute, CGFloat)){
    if rhs.0 == .AspectRatio {
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, secondView:lhs, attribute:rhs.0.attribute().1, constant:rhs.1)
    }else{
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, attribute:rhs.0.attribute().1, constant:rhs.1)
    }
}

public func +>=(lhs: View, rhs: (SelfAttribute, CGFloat)){
    if rhs.0 == .AspectRatio {
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, relation:.GreaterThanOrEqual, secondView:lhs, attribute:rhs.0.attribute().1, constant:rhs.1)
    }else{
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, relation:.GreaterThanOrEqual, attribute:rhs.0.attribute().1, constant:rhs.1)
    }
}

