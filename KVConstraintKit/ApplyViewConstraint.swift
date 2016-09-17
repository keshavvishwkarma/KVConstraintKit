//
// ApplyViewConstraint.swift
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

// MARK: - TO APPLY PREPARED SELF CONSTRAINTS -

extension View
{
    ///All of the below methods of this extension are used to Apply\Add constraint in receiver view (self ).
    
    public final func applyAspectRatioConstraint() {
        applyPreparedConstraintInView( constraint: NSLayoutConstraint.prepareSelfConstraint(self,attribute: .Width, attribute: .Height))
    }
    
    public final func applyWidthConstraint(width: CGFloat) {
        applyPreparedConstraintInView( constraint: NSLayoutConstraint.prepareSelfConstraint(self, attribute: .Width, constant: width))
    }
    
    public final func applyHeightConstraint(height: CGFloat) {
        applyPreparedConstraintInView( constraint: NSLayoutConstraint.prepareSelfConstraint(self, attribute: .Height, constant: height))
    }
    
    public final func applyAtLeastWidthConstraint(width: CGFloat){
        applyPreparedConstraintInView( constraint: NSLayoutConstraint.prepareSelfConstraint(self, attribute: .Width, relation:.LessThanOrEqual ,constant: width))
    }
    
    public final func applyAtLeastHeightConstraint(height: CGFloat){
        applyPreparedConstraintInView( constraint: NSLayoutConstraint.prepareSelfConstraint(self, attribute: .Height, relation:.GreaterThanOrEqual ,constant: height))
    }
    
    public final func applyAtMostWidthConstraint(width:CGFloat) {
        applyPreparedConstraintInView( constraint: NSLayoutConstraint.prepareSelfConstraint(self, attribute: .Width, relation:.LessThanOrEqual ,constant: width))
    }
    
    public final func applyAtMostHeightConstraint(height: CGFloat){
        applyPreparedConstraintInView( constraint: NSLayoutConstraint.prepareSelfConstraint(self, attribute: .Height, relation:.LessThanOrEqual ,constant: height))
    }
    
}

// MARK: - TO APPLIED PREPARED CONSTRAINTS
extension View
{
    ///All the below methods of this category are used to applied\add constraints in supreview of receiver view (self)
    
    public final func applyLeftPinConstraintToSuperview(padding p: CGFloat) {
        (self +== .Left).constant = p
    }
    
    public final func applyRightPinConstraintToSuperview(padding p: CGFloat) {
        (self +== .Right).constant = -p
    }
    
    public final func applyTopPinConstraintToSuperview(padding p: CGFloat) {
        (self +== .Top).constant = p
    }
    
    public final func applyBottomPinConstraintToSuperview(padding p: CGFloat) {
        (self +== .Bottom).constant = -p
    }
    
    public final func applyLeadingPinConstraintToSuperview(padding p: CGFloat) {
        (self +== .Leading).constant = p
    }
    
    public final func applyTrailingPinConstraintToSuperview(padding p: CGFloat) {
        (self +== .Trailing).constant = -p
    }
    
    public final func applyCenterXPinConstraintToSuperview(padding p: CGFloat) {
        (self +== .CenterX).constant = -p
    }
    
    public final func applyCenterYPinConstraintToSuperview(padding p: CGFloat) {
        (self +== .CenterY).constant = -p
    }
    
}

extension View
{
    /// This method is used to apply\add same leading and trailing pin constraints to superview.
    public final func applyLeadingAndTrailingPinConstraintToSuperview(padding p: CGFloat) {
        (self +== .Leading).constant  = p
        (self +== .Trailing).constant = -p
    }
    
    /// This method is used to apply\add same Top and Bottom pin constraints to superview.
    public final func applyTopAndBottomPinConstraintToSuperview(padding p: CGFloat) {
        (self +== .Top).constant = p
        (self +== .Bottom).constant = -p
    }
    
    public final func applyConstraintFitToSuperview() {
        self +== [.Top, .Bottom, .Leading, .Trailing]
        // OR
        // applyConstraintFitToSuperview(contentInset: UIEdgeInsetsZero)
    }

    public final func applyConstraintFitToSuperviewHorizontally() {
        self +== [.Leading, .Trailing]
    }
    
    public final func applyConstraintFitToSuperviewVertically() {
        self +== [.Top, .Bottom]
    }
    
    public final func applyConstraintFitToSuperview(contentInset inset:UIEdgeInsets)
    {
        if !(inset.top.isFinite && inset.top.isNaN) {
            (self +== .Top).constant = inset.top
        } else {
            debugPrint("can not add inset.top because it does not have finite value")
        }
        
        if !(inset.bottom.isFinite && inset.bottom.isNaN) {
            (self +== .Bottom).constant = -inset.bottom
        } else {
            debugPrint("can not add inset.top because it does not have finite value")
        }
        
        if !(inset.left.isFinite && inset.left.isNaN) {
            (self +== .Leading).constant = inset.left
        } else {
            debugPrint("can not add inset.top because it does not have finite value")
        }
        
        if !(inset.right.isFinite && inset.right.isNaN) {
            (self +== .Trailing).constant = -inset.right
        } else {
            debugPrint("can not add inset.top because it does not have finite value")
        }
        
    }
    
    /// alignCenter
    public final func applyConstraintForCenterInSuperview() {
        self +== [.CenterX, .CenterY]
    }
    
    /// alignFromHorizontallyCenter
    public final func applyConstraintForHorizontallyCenterInSuperview() {
        self +== .CenterX
    }
    
    /// alignFromVerticallyCenter
    public final func applyConstraintForVerticallyCenterInSuperview() {
        self +== .CenterY
    }

}
