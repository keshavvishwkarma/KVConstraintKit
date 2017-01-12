//
//  KVConstraintKitProtocol.swift
//  https://github.com/keshavvishwkarma/KVConstraintKit.git
//
//  Distributed under the MIT License.
//
//  Copyright © 2016 Keshav Vishwkarma. All rights reserved.
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
    func +(lhs: Self, rhs: NSLayoutConstraint)  -> NSLayoutConstraint
    
    /// TO ADD MULTIPLE CONSTRAINTS
    func +(lhs: Self, rhs: [NSLayoutConstraint])-> [NSLayoutConstraint]
}

//********* Define Removable protocol *********//

public protocol Removable: class {
    /// TO REMOVE SINGLE CONSTRAINTS
    func -(lhs: Self, rhs: NSLayoutConstraint)  -> NSLayoutConstraint
    
    /// TO REMOVE MULTIPLE CONSTRAINTS
    func -(lhs: Self, rhs: [NSLayoutConstraint])-> [NSLayoutConstraint]
}

//********* Define SelfAddable protocol *********//

public protocol SelfAddable: class {
    func +==(lhs: Self, rhs: (SelfAttribute, CGFloat))
    func +>=(lhs: Self, rhs: (SelfAttribute, CGFloat))
    func +<=(lhs: Self, rhs: (SelfAttribute, CGFloat))
}

//********* Define LayoutRelationable protocol *********//

public protocol LayoutRelationable: class {
    /// TO ADD SINGLE RELATION CONSTRAINT
    func +==(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint
    func +>=(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint
    func +<=(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint
    
    /// TO ADD MULTIPLE RELATION CONSTRAINT
    func +==(lhs: Self, rhs: [NSLayoutAttribute])
    func +>=(lhs: Self, rhs: [NSLayoutAttribute])
    func +<=(lhs: Self, rhs: [NSLayoutAttribute])
    
    /// TO ADD SINGLE RELATION CONSTRAINT WITH MULTIPLEIR
    func *>=(lhs: Self, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint
    func *==(lhs: Self, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint
    func *<=(lhs: Self, rhs: (NSLayoutAttribute, CGFloat)) -> NSLayoutConstraint
    
    /// TO ADD MULTIPLE RELATION CONSTRAINT WITH MULTIPLEIR
    func *==(lhs: Self, rhs: [(NSLayoutAttribute, CGFloat)])
    func *>=(lhs: Self, rhs: [(NSLayoutAttribute, CGFloat)])
    func *<=(lhs: Self, rhs: [(NSLayoutAttribute, CGFloat)])

}

//********* Define Accessable protocol *********//
public protocol Accessable: class {
    /// TO ACCESS CONSTRAINT BASED ON LAYOUT ATTRIBUTE
    func <-(lhs: Self, rhs: NSLayoutAttribute) -> NSLayoutConstraint?
}

//********* Define Modifyable protocol *********//
public protocol Modifiable: class {
    /// TO CHANGE MULTIPLIER OF CONSTRAINTS
    func *(lhs: Self, rhs: (NSLayoutConstraint, CGFloat))
    
    /// TO CHANGE PRIORITY OF CONSTRAINTS
    func ~(lhs: Self, rhs: (NSLayoutAttribute, LayoutPriority))
    
    /// TO CHANGE RELATION OF CONSTRAINTS
    func ~(lhs: Self, rhs: (NSLayoutConstraint, NSLayoutRelation))
    
    /// TO CHANGE REPLACE ALREADY APPLIED CONSTRAINTS VIA NEW ONE
    /// (containerView ~ (old, new))
    func ~(lhs: Self, rhs: (NSLayoutConstraint, NSLayoutConstraint))
    
}

