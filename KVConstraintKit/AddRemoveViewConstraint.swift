//
// AddRemoveViewConstraint.swift
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

/// TO APPLY/ADD CONSTRAINTS OR TO REMOVE APPLIED CONSTRAINTS
extension View
{
    /// This is the common methods to add the constraint in the receiver only once. If constraint already exists then it will only update that constraint and return that constraint.
    public final func applyPreparedConstraintInView(constraint c: NSLayoutConstraint) -> NSLayoutConstraint
    {
        // If this constraint is already added then it update the constraint values else added new constraint.
        
        let appliedConstraint = constraints.containsApplied(constraint: c)
        
        // if this constraint is already added then it update the constraint values else added new constraint
        if (appliedConstraint != nil) {
            appliedConstraint!.constant = c.constant
            return appliedConstraint!
        }
        
        addConstraint(c)

        return c
        
    }
    
    /// MARK: - Remove Constraints From a specific View
    public final func removeAppliedConstraintFromSupreview() {
        let superview = self.superview
        removeFromSuperview()
        superview?.addSubview(self)
    }
    
    public final func removeAllAppliedConstraints() {
        removeAppliedConstraintFromSupreview()
        removeConstraints(constraints)
    }
    
}