// 
// UpdateAppliedConstraint.swift
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

/// MARK: TO UPDATE/MODIFY APPLIED CONSTRAINTS
extension View
{
    // MARK : To Update Modified Applied Constraints
    
    public final func updateModifyConstraints(){
        layoutIfNeeded()
        setNeedsLayout()
    }
    
    public final func updateModifyConstraintsWithAnimation(completion:((Bool) -> Void)?)
    {
        let duration = NSTimeInterval(UINavigationControllerHideShowBarDuration)
        let referenceView = (superview != nil) ? superview! : self
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            referenceView.updateModifyConstraints()
            }, completion: completion)
        
    }
    
    public final func updateAppliedConstraintConstantValueForIpadBy(attribute a: NSLayoutAttribute) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            updateAppliedConstraintConstantValueBy(a, withConstantRatio: Defualt.iPadRation )
        }
    }
    
    public final func updateAppliedConstraintConstantValueBy(attribute: NSLayoutAttribute, withConstantRatio ratio: CGFloat){
        accessAppliedConstraintBy(attribute: attribute)?.constant *= ratio
    }
    
    /// This method is used to replace already applied constraint by new constraint.
    
    public final func replaceAppliedConastrainInView(appliedConstraint ac: NSLayoutConstraint!, replaceByConstraint rc: NSLayoutConstraint!) {
        assert( rc != nil, "modified constraint must not be nil")
        if ac.isEqualTo(constraint: rc) {
            removeConstraint(ac)
            addConstraint(rc)
        } else {
            debugPrint("applied constraint does not contain receiver view = \(self) \n applied constraint =  \(ac)")
        }
    }
    
    /// This method is used to change the priority of constraint.
    /// TO DO Optimise Algorithm - a process or set of rules to be followed in calculations or other problem-solving operations, especially by a computer.

    public final func changeAppliedConstraint(priority p: UILayoutPriority, forAttribute attr: NSLayoutAttribute)
    {
        guard let appliedConstraint = accessAppliedConstraintBy(attribute: attr) else { return  }
        
        if appliedConstraint.isSelfConstraint() {
            removeConstraint(appliedConstraint)
            appliedConstraint.priority = p
            addConstraint(appliedConstraint)
        } else {
            superview?.removeConstraint( appliedConstraint)
            appliedConstraint.priority = p
            superview?.addConstraint(appliedConstraint)
        }
    }
    
}