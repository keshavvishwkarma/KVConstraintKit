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

#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public enum SelfAttribute: Int {
    case width = 7, height, aspectRatio = 64
    
    func attribute()-> (NSLayoutAttribute,NSLayoutAttribute){
        if self == .aspectRatio {
            return (.width, .height)
        }else{
            return (NSLayoutAttribute(rawValue: self.rawValue)!, .notAnAttribute )
        }
    }
}

extension NSLayoutConstraint
{
    public struct Defualt {
        #if os(iOS) || os(tvOS)
        public static let iPadRatio = CGFloat(3.0/4.0)
        #endif
        
        public static let lessMaxPriority = CGFloat(999.99996)
    }
    
    /// :name:	prepareConstraint
    public final class func prepareConstraint(_ item: AnyObject, attribute attr1: NSLayoutAttribute, relation: NSLayoutRelation = .equal, toItem: AnyObject?=nil, attribute attr2: NSLayoutAttribute = .notAnAttribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attr1, relatedBy: relation, toItem: toItem, attribute: attr2, multiplier: multiplier, constant: constant)
    }
    
}

extension NSLayoutConstraint
{
    public final func isEqualTo(constraint c:NSLayoutConstraint, shouldIgnoreMutiplier m:Bool = true, shouldIgnoreRelation r:Bool = true)-> Bool
    {
        var isEqualExceptMultiplier = firstItem === c.firstItem && firstAttribute == c.firstAttribute && secondItem === c.secondItem && secondAttribute == c.secondAttribute
        
        if !isEqualExceptMultiplier
        {
            isEqualExceptMultiplier = firstItem === c.secondItem && firstAttribute == c.secondAttribute && secondItem === c.firstItem && secondAttribute == c.firstAttribute
        }
        
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
    
    /// Reverses the first and second items of 'NSLayoutConstraint' object.
    public final func reversed() -> NSLayoutConstraint
    {
        if let secondItemObj = secondItem {
            return NSLayoutConstraint(item: secondItemObj, attribute: secondAttribute, relatedBy: relation, toItem: firstItem, attribute: firstAttribute, multiplier: multiplier, constant: constant)
        } else {
            return self
        }
        
    }
    
    /// modifies the layout relation of 'NSLayoutConstraint' object.
    public final func modified(relation r: NSLayoutRelation) -> NSLayoutConstraint
    {
        if relation == r {
            return self
        }
        
        return NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: r, toItem: secondItem, attribute: secondAttribute, multiplier: multiplier, constant: constant)
    }

    /// modifies the multiplier of 'NSLayoutConstraint' object.
    public final func modified(multiplier m: CGFloat) -> NSLayoutConstraint
    {
        if multiplier == m {
            return self
        }
        
        return NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: relation, toItem: secondItem, attribute: secondAttribute, multiplier: m, constant: constant)
    }
    
    final func isSelfConstraint() -> Bool
    {
        // For aspect Ratio
        if firstItem === secondItem && ( firstAttribute == .width && secondAttribute == .height || firstAttribute == .height && secondAttribute == .width){
            return true
        }
        // if (firstItem !== secondItem && secondAttribute == .NotAnAttribute) && (firstAttribute == .Width || firstAttribute == .Height)
        
        if (secondItem == nil && secondAttribute == .notAnAttribute) && (firstAttribute == .width || firstAttribute == .height) {
            return true
        }
        
        return false
    }
    
}

extension Array where Element: NSLayoutConstraint
{
    func containsApplied(constraint c: Element, shouldIgnoreMutiplier m:Bool = true) -> Element? {
        #if os(iOS) || os(tvOS)
            let reverseConstraints = reversed().filter {
                !( $0.firstItem is UILayoutSupport || $0.secondItem is UILayoutSupport)
            }
        #else
            let reverseConstraints = reverse()
        #endif
        
        return reverseConstraints.filter {
            $0.isEqualTo(constraint: c, shouldIgnoreMutiplier: m)
            }.first
    }
}


