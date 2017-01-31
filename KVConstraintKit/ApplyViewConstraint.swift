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

#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

// MARK: - TO APPLY PREPARED SELF CONSTRAINTS -

extension View
{
    /// All of the below methods of this extension are used to Apply\Add constraint in receiver view (self ).
    
    public final func applyAspectRatioConstraint() {
        self +== (.aspectRatio, 0)
    }
    
    public final func applyWidthConstraint(_ width: CGFloat) {
        self +== (.width, width)
    }
    
    public final func applyHeightConstraint(_ height: CGFloat) {
        self +== (.height, height)
    }
    
    public final func applyAtLeastHeightConstraint(_ height: CGFloat) {
        self +>= (.height, height)
    }
    
    public final func applyAtMostHeightConstraint(_ height: CGFloat) {
        self +<= (.height, height)
    }
    
    public final func applyAtLeastWidthConstraint(_ width: CGFloat) {
        self +>= (.width, width)
    }
    
    public final func applyAtMostWidthConstraint(_ width:CGFloat) {
        self +<= (.width, width)
    }
    
}

// MARK : - TO APPLIED PREPARED CONSTRAINTS
extension View
{
    /// All the below methods of this category are used to applied\add constraints in supreview of receiver view (self)
    
    public final func applyLeftPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .left).constant = padding
    }
    
    public final func applyRightPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .right).constant = padding
    }
    
    public final func applyTopPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .top).constant = padding
    }
    
    public final func applyBottomPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .bottom).constant = padding
    }
    
    public final func applyLeadingPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .leading).constant = padding
    }
    
    public final func applyTrailingPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .trailing).constant = padding
    }
    
    /// To Horizontally Center In Superview
    public final func applyCenterXPinConstraintToSuperview(_ offset: CGFloat) {
        (self +== .centerX).constant = offset
    }
    
    /// To Vertically Center In Superview
    public final func applyCenterYPinConstraintToSuperview(_ offset: CGFloat) {
        (self +== .centerY).constant = offset
    }
    
}

extension View
{
    /// This method is used to apply\add CenterX and CenterY pin constraints to superview with same padding.
    public final func applyConstraintToCenterInSuperview(_ offset:CGPoint = CGPoint.zero) {
        (self +== .centerX).constant = offset.x
        (self +== .centerY).constant = offset.y
    }
    
    /// This method is used to apply\add same leading, trailing, Top and Bottom pin constraints to superview with same padding.
    public final func applyConstraintFitToSuperview(_ padding: CGFloat = 0.0) {
        applyConstraintFitToSuperview(contentInset: EdgeInsets.edgeInset(CGFloat(0)))
    }
    
    /// This method is used to apply\add same leading and trailing pin constraints to superview.
    public final func applyConstraintFitHorizontallyToSuperview(_ padding: CGFloat = 0.0) {
        (self +== .leading).constant  = padding
        (self +== .trailing).constant = padding
    }
    
    /// This method is used to apply\add same Top and Bottom pin constraints to superview.
    public final func applyConstraintFitVerticallyToSuperview(_ padding: CGFloat = 0.0) {
        (self +== .top).constant    = padding
        (self +== .bottom).constant = padding
    }
    
    /// This method is used to apply\add same leading, trailing, Top and Bottom pin constraints to superview.
    public final func applyConstraintFitToSuperview(contentInset inset:EdgeInsets = EdgeInsets.zero)
    {
        if !(inset.top.isFinite && inset.top.isNaN) {
            (self +== .top).constant = inset.top
        } else {
            debugPrint("can not add inset.top because it does not have finite value")
        }
        
        if !(inset.bottom.isFinite && inset.bottom.isNaN) {
            (self +== .bottom).constant = inset.bottom
        } else {
            debugPrint("can not add inset.top because it does not have finite value")
        }
        
        if !(inset.left.isFinite && inset.left.isNaN) {
            (self +== .leading).constant = inset.left
        } else {
            debugPrint("can not add inset.top because it does not have finite value")
        }
        
        if !(inset.right.isFinite && inset.right.isNaN) {
            (self +== .trailing).constant = inset.right
        } else {
            debugPrint("can not add inset.top because it does not have finite value")
        }
        
    }
    
}
