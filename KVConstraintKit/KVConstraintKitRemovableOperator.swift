//
//  KVConstraintKitRemovableOperator.swift
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

import Foundation

//********* DEFINE NEW INTERFACE Removable *********//

public protocol Removable:class {
    /// TO REMOVE SINGLE CONSTRAINTS
    func -(lhs: Self, rhs: NSLayoutConstraint)  -> NSLayoutConstraint
    
    /// TO REMOVE MULTIPLE CONSTRAINTS
    func -(lhs: Self, rhs: [NSLayoutConstraint])-> [NSLayoutConstraint]
}

// MARK: Removable
extension View : Removable { }

/// to remove single constraint from the receiver view
public func -(lhs: View, rhs: NSLayoutConstraint) -> NSLayoutConstraint {
    lhs.removeConstraint(rhs); return rhs
}

/// to remove multiple constraints from the receiver view
public func -(lhs: View, rhs: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
    if rhs.isEmpty {    return rhs     }
    lhs.removeConstraints(rhs); return rhs
}


