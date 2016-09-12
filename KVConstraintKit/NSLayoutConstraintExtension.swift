//
//  NSLayoutConstraintExtension.swift
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

import UIKit

extension NSLayoutConstraint
{
    public struct Defualt {
        public static let iPadRation      = CGFloat(3.0/4.0)
        public static let lessMaxPriority = CGFloat(999.99996)
    }
    
    /// :name:	prepareConstraint
    public static func prepareConstraint(item: AnyObject, attribute attr1: NSLayoutAttribute, relation: NSLayoutRelation = .Equal, toItem: AnyObject?=nil, attribute attr2: NSLayoutAttribute = .NotAnAttribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attr1, relatedBy: relation, toItem: toItem, attribute: attr2, multiplier: multiplier, constant: constant)
    }
    
    /// :name:	prepare Self Constraint
    public static func prepareSelfConstraint(item: AnyObject, attribute attr1: NSLayoutAttribute, relation: NSLayoutRelation = .Equal, attribute attr2: NSLayoutAttribute = .NotAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attr1, relatedBy: relation, toItem:  (attr2 == .NotAnAttribute) ? nil : item, attribute: attr2, multiplier: 1, constant: constant)
    }
    
    /// prepare Constraint by Visual Format Language
    public final class func prepareConstraint(format: String, options: NSLayoutFormatOptions = [], metrics: Dictionary<String, AnyObject>?=nil, views: Dictionary<String, AnyObject>) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraintsWithVisualFormat( format, options: options, metrics: metrics, views: views )
    }
    
    
}

extension NSLayoutConstraint
{
    public final func isEqualTo(constraint c:NSLayoutConstraint, shouldIgnoreMutiplier m:Bool = true, shouldIgnoreRelation r:Bool = true)-> Bool
    {
        let isEqualExceptMultiplier = firstItem === c.firstItem && firstAttribute == c.firstAttribute && firstItem === c.firstItem && secondAttribute == c.secondAttribute
        debugPrint(isEqualExceptMultiplier)
        
        if m && r {
            return isEqualExceptMultiplier
        }
        else if m {
            return isEqualExceptMultiplier && multiplier == c.multiplier
        }
        else if r {
            return isEqualExceptMultiplier && relation == c.relation
        }
        
        return isEqualExceptMultiplier && multiplier == c.multiplier && relation == c.relation
    }
    
    public final func reverseConstraintItems() -> NSLayoutConstraint
    {
        if let secondItemObj = secondItem {
            return NSLayoutConstraint(item: secondItemObj, attribute: secondAttribute, relatedBy: relation, toItem: firstItem, attribute: firstAttribute, multiplier: multiplier, constant: constant)
        } else {
            return self
        }
        
    }
    
    public final func modifyConstraintBy(relation r: NSLayoutRelation) -> NSLayoutConstraint
    {
        if relation == r {
            return self
        }
        
        return NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: r, toItem: secondItem, attribute: secondAttribute, multiplier: multiplier, constant: constant)
    }
    
    public final func modifyConstraintBy(multiplier m: CGFloat) -> NSLayoutConstraint
    {
        if multiplier == m {
            return self
        }
        
        return NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: relation, toItem: secondItem, attribute: secondAttribute, multiplier: m, constant: constant)
    }
    
    final func isSelfConstraint() -> Bool
    {
        // For aspect Ratio
        if firstItem === secondItem && ( firstAttribute == .Width && secondAttribute == .Height || firstAttribute == .Height && secondAttribute == .Width){
            return true
        }
        // if (firstItem !== secondItem && secondAttribute == .NotAnAttribute) && (firstAttribute == .Width || firstAttribute == .Height)
        
        if (secondItem == nil && secondAttribute == .NotAnAttribute) && (firstAttribute == .Width || firstAttribute == .Height) {
            return true
        }
        
        return false
    }
    
}

// Same functionality for classes,
extension Array where Element: NSLayoutConstraint {
    func containsApplied(constraint c: Element, shouldIgnoreMutiplier m:Bool = false) -> Element? {
        return reverse().filter { ($0 as NSLayoutConstraint).isEqualTo(constraint: c, shouldIgnoreMutiplier: m)}.first
    }
}

//With protocol extensions you can do this,
extension Array where Element : Equatable {
    func findApplied(constraint c: Element) -> Element? {
        return reverse().filter { $0 == c }.first
    }
}