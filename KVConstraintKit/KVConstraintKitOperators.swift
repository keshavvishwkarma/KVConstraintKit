//
//  KVConstraintKitOperators.swift
//  https://github.com/keshavvishwkarma/KVConstraintKit.git
//
//  Distributed under the MIT License.
//
//  Copyright © 2016-2017 Keshav Vishwkarma <keshavvbe@gmail.com>. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//

#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

//********* DEFINE NEW OPERATOR *********//
infix operator   ~ :AdditionPrecedence
infix operator  <- :AdditionPrecedence
infix operator +== :AdditionPrecedence
infix operator +>= :AdditionPrecedence
infix operator +<= :AdditionPrecedence
infix operator *<= :AdditionPrecedence
infix operator *== :AdditionPrecedence
infix operator *>= :AdditionPrecedence

infix operator |==| :AdditionPrecedence
infix operator |>=| :AdditionPrecedence
infix operator |<=| :AdditionPrecedence

extension View : Addable, Removable, Accessable, LayoutRelationable {}

// Operators Definations

// MARK: Addable
extension Addable where Self: View {
    /// To add single constraint on the receiver view
    @discardableResult public static func +(lhs: Self, rhs: NSLayoutConstraint) -> NSLayoutConstraint {
        return lhs.applyPreparedConstraintInView(constraint: rhs)
    }
}

extension View {
    /// To add multiple constraints on the lhs view
    @discardableResult public static func +(lhs: View, rhs: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        return rhs.map { lhs + $0 }
    }
}

// MARK: Removable
extension Removable where Self: View {
    /// To remove single constraint from the receiver view
    @discardableResult public static func -(lhs: Self, rhs: NSLayoutConstraint) -> NSLayoutConstraint {
        lhs.removeConstraint(rhs); return rhs
    }
    
    /// To remove multiple constraint from the receiver view
    @discardableResult public static func -(lhs: Self, rhs: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        if rhs.isEmpty {    return rhs     }
        lhs.removeConstraints(rhs); return rhs
    }
    
}

// MARK: Accessable
extension Accessable where Self: View {
    @discardableResult public static func <-(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint?{
        return lhs.accessAppliedConstraintBy(attribute: rhs)
    }
    
    @discardableResult public static func <-(lhs: Self, rhs: (NSLayoutAttribute, NSLayoutRelation)) -> NSLayoutConstraint?{
        return lhs.accessAppliedConstraintBy(attribute: rhs.0, relation: rhs.1)
    }
    
}

// MARK: LayoutRelationable
extension LayoutRelationable where Self: View {
    
    /// TO ADD SINGLE RELATION CONSTRAINT
    //-----------------------------------------
    /// (containerView +== .Top).constant = 0
    @discardableResult public static func +<=(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint {
        return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs, attribute: rhs, relation: .lessThanOrEqual)
    }
    
    /// (leftContainerView +== .Top).constant = 0
    @discardableResult public static func +==(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint {
        return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs, attribute: rhs)
    }
    
    /// (leftContainerView +== .Top).constant = 0
    @discardableResult public static func +>=(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint {
        return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs, attribute: rhs, relation: .greaterThanOrEqual)
    }
    
    /// TO ADD SINGLE EQUAL RELATION CONSTRAINT WITH MULTIPLEIR
    //-------------------------------------------------------------
    /// (containerView +== (.Top, 1.5)).constant = 0
    @discardableResult public static func *>=(lhs: Self, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint {
        return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs.0, attribute: rhs.0, relation: .greaterThanOrEqual, multiplier: rhs.1)
    }
    
    /// (containerView +*== (.Top, multiplier) ).constant = 0
    @discardableResult public static func *==(lhs: Self, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint {
        return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs.0, attribute: rhs.0, multiplier: rhs.1)
    }
    
    @discardableResult public static func *<=(lhs: Self, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint {
        return lhs.superview! + lhs.prepareConstraintToSuperview(attribute: rhs.0, attribute: rhs.0, relation: .lessThanOrEqual, multiplier: rhs.1)
    }
    
    /// TO ADD SIBLINGS RELATION CONSTRAINT
    //-------------------------------------------------------------
    @discardableResult public static func |<=|(lhs: Self, rhs: (NSLayoutAttribute, NSLayoutAttribute, View)) -> NSLayoutConstraint {
        return lhs.superview! + lhs.prepareConstraintFromSiblingView(attribute: rhs.0, toAttribute: rhs.1, ofView: rhs.2, relation:.lessThanOrEqual)
    }
    
    @discardableResult public static func |==|(lhs: Self, rhs: (NSLayoutAttribute, NSLayoutAttribute, View)) -> NSLayoutConstraint {
        return lhs.superview! + lhs.prepareConstraintFromSiblingView(attribute: rhs.0, toAttribute: rhs.1, ofView: rhs.2)
    }
    
    @discardableResult public static func |>=|(lhs: Self, rhs: (NSLayoutAttribute, NSLayoutAttribute, View)) -> NSLayoutConstraint {
        return lhs.superview! + lhs.prepareConstraintFromSiblingView(attribute: rhs.0, toAttribute: rhs.1, ofView: rhs.2, relation:.greaterThanOrEqual)
    }
}

/// MARK: - TO ADD MULTIPLE RELATIONAL CONSTRAINTS
extension View {
    
    // TO ADD MULTIPLE RELATIONAL CONSTRAINTS WITH CONSTANT
    //--------------------------------------------------------------
    // (containerView +== [.Top, Bottom, Leading, Trailing])
    
    /// With defualt constant that is - 0 (Zero) on a specific attribute
    @discardableResult public static func +<=(lhs: View, rhs: [NSLayoutAttribute]) -> [NSLayoutConstraint] {
        return rhs.map { lhs +<= $0 }
    }
    
    @discardableResult public static func +==(lhs: View, rhs: [NSLayoutAttribute]) -> [NSLayoutConstraint] {
        return rhs.map { lhs +== $0 }
    }
    
    @discardableResult public static func +>=(lhs: View, rhs: [NSLayoutAttribute]) -> [NSLayoutConstraint] {
        return rhs.map { lhs +>= $0 }
    }
    
    // TO ADD MULTIPLE RELATION CONSTRAINT WITH MULTIPLEIR
    //-------------------------------------------------------------
    // (containerView +== [(.Height, 1.5), (.Width, 0.8)])
    @discardableResult public static func *<=(lhs: View, rhs: [(NSLayoutAttribute, CGFloat)]) -> [NSLayoutConstraint] {
        return rhs.map { lhs *<= $0 }
    }
    
    @discardableResult public static func *==(lhs: View, rhs: [(NSLayoutAttribute, CGFloat)]) -> [NSLayoutConstraint] {
        return rhs.map { lhs *== $0 }
    }
    
    @discardableResult public static func *>=(lhs: View, rhs: [(NSLayoutAttribute, CGFloat)]) -> [NSLayoutConstraint] {
        return rhs.map { lhs *>= $0 }
    }
    
}

/// TO ADD SelfAddable CONSTRAINT
//-------------------------------------------------------------

extension View : SelfAddable { }

public func +<=(lhs: View, rhs: (SelfAttribute, CGFloat)){
    if rhs.0 == .aspectRatio {
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, secondView:lhs,attribute:rhs.0.attribute().1, relation:.lessThanOrEqual, constant:rhs.1)
    }else{
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, attribute:rhs.0.attribute().1, relation:.lessThanOrEqual, constant:rhs.1)
    }
}

public func +==(lhs: View, rhs: (SelfAttribute, CGFloat)){
    if rhs.0 == .aspectRatio {
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, secondView:lhs, attribute:rhs.0.attribute().1, constant:rhs.1)
    }else{
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, attribute:rhs.0.attribute().1, constant:rhs.1)
    }
}

public func +>=(lhs: View, rhs: (SelfAttribute, CGFloat)){
    if rhs.0 == .aspectRatio {
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, secondView:lhs, attribute:rhs.0.attribute().1, relation:.greaterThanOrEqual, constant:rhs.1)
    }else{
        lhs + View.prepareConstraint(lhs, attribute:rhs.0.attribute().0, attribute:rhs.0.attribute().1, relation:.greaterThanOrEqual, constant:rhs.1)
    }
}

// MARK: Modifiable
//-------------------------------------------------------------

extension View : Modifiable { }

/// (containerView ~ (constraint, multiplier))
public func *(lhs: View, rhs: (NSLayoutConstraint, CGFloat)) {
    guard let constraint = rhs.0.modified(multiplier: rhs.1) else { return  }
    (lhs ~ (rhs.0, constraint))
}

/// (containerView ~ (constraint, multiplier))
public func ~(lhs: View, rhs: (NSLayoutConstraint, NSLayoutRelation)) {
    guard let constraint = rhs.0.modified(relation: rhs.1) else { return  }
    (lhs ~ (rhs.0, constraint))
}

/// (containerView ~ (old, new))
public func ~(lhs: View, rhs: (NSLayoutConstraint, NSLayoutConstraint)) {
    // Remove old one
    _ = rhs.0.isSelfConstraint() ? lhs - rhs.0 : lhs.superview! - rhs.0
    _ = rhs.1.isSelfConstraint() ? lhs - rhs.1 : lhs.superview! - rhs.1
}

/// (containerView ~ (.Top, .Equal))
public func ~(lhs: View, rhs: (NSLayoutAttribute, LayoutPriority)) {
    guard let constraint = (lhs <- rhs.0) else { return  }
    if constraint.isSelfConstraint() {
        _ = lhs - constraint
        constraint.priority = rhs.1
        _ = lhs + constraint
    } else {
        _ = lhs.superview! - constraint
        constraint.priority = rhs.1
        _ = lhs.superview! + constraint
    }
    
}

