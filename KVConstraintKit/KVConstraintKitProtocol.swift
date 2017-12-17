//
//  KVConstraintKitProtocol.swift
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

//********* Define Addable protocol *********//
public protocol Addable: class {
    /// TO ADD SINGLE CONSTRAINTS
    static func +(lhs: Self, rhs: NSLayoutConstraint)  -> NSLayoutConstraint
    
    /// TO ADD MULTIPLE CONSTRAINTS
    static func +(lhs: Self, rhs: [NSLayoutConstraint])-> [NSLayoutConstraint]
}

//********* Define Removable protocol *********//
public protocol Removable: class {
    /// TO REMOVE SINGLE CONSTRAINTS
    static func -(lhs: Self, rhs: NSLayoutConstraint)  -> NSLayoutConstraint
    
    /// TO REMOVE MULTIPLE CONSTRAINTS
    static func -(lhs: Self, rhs: [NSLayoutConstraint])-> [NSLayoutConstraint]
}

//********* Define Accessable protocol *********//
public protocol Accessable: class {
    /// TO ACCESS CONSTRAINT BASED ON LAYOUT ATTRIBUTE
    static func <-(lhs: Self, rhs: LayoutAttribute) -> NSLayoutConstraint?
}

//********* Define SelfAddable protocol *********//
public protocol SelfAddable: class {
    static func +==(lhs: Self, rhs: (SelfAttribute, CGFloat)) -> NSLayoutConstraint
    static func +>=(lhs: Self, rhs: (SelfAttribute, CGFloat)) -> NSLayoutConstraint
    static func +<=(lhs: Self, rhs: (SelfAttribute, CGFloat)) -> NSLayoutConstraint
}

//********* Define LayoutRelationable protocol *********//
public protocol LayoutRelationable: class {
    /// TO ADD SINGLE RELATION CONSTRAINT
    static func +==(lhs: Self, rhs: LayoutAttribute) -> NSLayoutConstraint
    static func +>=(lhs: Self, rhs: LayoutAttribute) -> NSLayoutConstraint
    static func +<=(lhs: Self, rhs: LayoutAttribute) -> NSLayoutConstraint
    
    /// TO ADD MULTIPLE RELATION CONSTRAINT
    static func +==(lhs: Self, rhs: [LayoutAttribute]) -> [NSLayoutConstraint]
    static func +>=(lhs: Self, rhs: [LayoutAttribute]) -> [NSLayoutConstraint]
    static func +<=(lhs: Self, rhs: [LayoutAttribute]) -> [NSLayoutConstraint]
    
    /// TO ADD SINGLE RELATION CONSTRAINT WITH MULTIPLEIR
    static func *>=(lhs: Self, rhs: (LayoutAttribute, CGFloat)) -> NSLayoutConstraint
    static func *==(lhs: Self, rhs: (LayoutAttribute, CGFloat)) -> NSLayoutConstraint
    static func *<=(lhs: Self, rhs: (LayoutAttribute, CGFloat)) -> NSLayoutConstraint
    
    /// TO ADD MULTIPLE RELATION CONSTRAINT WITH MULTIPLEIR
    static func *==(lhs: Self, rhs: [(LayoutAttribute, CGFloat)]) -> [NSLayoutConstraint]
    static func *>=(lhs: Self, rhs: [(LayoutAttribute, CGFloat)]) -> [NSLayoutConstraint]
    static func *<=(lhs: Self, rhs: [(LayoutAttribute, CGFloat)]) -> [NSLayoutConstraint]
    
}

//********* Define Modifyable protocol *********//
public protocol Modifiable: class {
    /// TO CHANGE MULTIPLIER OF CONSTRAINTS
    static func *(lhs: Self, rhs: (NSLayoutConstraint, CGFloat))
    
    /// TO CHANGE PRIORITY OF CONSTRAINTS
    static func ~(lhs: Self, rhs: (LayoutAttribute, LayoutPriority))
    
    /// TO CHANGE RELATION OF CONSTRAINTS
    static func ~(lhs: Self, rhs: (NSLayoutConstraint, LayoutRelation))
    
    /// TO CHANGE REPLACE ALREADY APPLIED CONSTRAINTS VIA NEW ONE
    /// (containerView ~ (old, new))
    static func ~(lhs: Self, rhs: (NSLayoutConstraint, NSLayoutConstraint))
    
}

