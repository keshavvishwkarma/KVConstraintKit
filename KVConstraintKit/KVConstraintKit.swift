//
//  KVConstraintKit.swift
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

public struct KVConstraintKit
{
    /// :name:	prepareConstraint
    public static func prepareConstraint(item: AnyObject, attribute attr1: NSLayoutAttribute, relation: NSLayoutRelation = .Equal, toItem: AnyObject?=nil, attribute attr2: NSLayoutAttribute = .NotAnAttribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> NSLayoutConstraint! {
        return NSLayoutConstraint(item: item, attribute: attr1, relatedBy: relation, toItem: toItem, attribute: attr2, multiplier: multiplier, constant: constant)
    }
    
    /// prepare Constraint by Visual Format Language
    public static func constraint(format: String, options: NSLayoutFormatOptions = [], metrics: Dictionary<String, AnyObject>?=nil, views: Dictionary<String, AnyObject>) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraintsWithVisualFormat( format, options: options, metrics: metrics, views: views )
    }
    
    // Here we are preparing the Self Conastrain of item
    
    ///:name: prepareAspectRatioConstraint
    public static func prepareAspectRatioConstraint(item: AnyObject) -> NSLayoutConstraint! {
        return prepareConstraint(item, attribute: .Width, toItem: item, attribute: .Height)
    }
    
    ///:name: prepareHeightConstraint
    public static func prepareHeightConstraint(item: AnyObject, relation: NSLayoutRelation = .Equal, constant: CGFloat = 0) -> NSLayoutConstraint! {
        return prepareConstraint(item, attribute: .Height, relation:relation , constant:constant)
    }
    
    ///:name: prepareWidthConstraint
    public static func prepareWidthConstraint(item: AnyObject, relation: NSLayoutRelation = .Equal, constant: CGFloat = 0) -> NSLayoutConstraint! {
        return prepareConstraint(item, attribute: .Width, relation:relation , constant:constant)
    }
    
    
}