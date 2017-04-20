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
    // All of the below methods of this extension are used to Apply\Add constraint in receiver view (self ).

    /// Sets the aspect ratio of a view.
    public final func applyAspectRatioConstraint() {
        self +== (.aspectRatio, 0)
    }

    /**
     Sets the width of a view.
     - Parameter width: A CGFloat value.
     */
    public final func applyWidthConstraint(_ width: CGFloat) {
        self +== (.width, width)
    }
    
    /**
     Sets the height of a view.
     - Parameter height: A CGFloat value.
     */
    public final func applyHeightConstraint(_ height: CGFloat) {
        self +== (.height, height)
    }
    
    /**
     Sets the at least height of a view.
     - Parameter height: A CGFloat value.
     */
    public final func applyAtLeastHeightConstraint(_ height: CGFloat) {
        self +>= (.height, height)
    }
    
    /**
     Sets the at most height of a view.
     - Parameter height: A CGFloat value.
     */
    public final func applyAtMostHeightConstraint(_ height: CGFloat) {
        self +<= (.height, height)
    }
    
    /**
     Sets the at least width of a view.
     - Parameter width: A CGFloat value.
     */
    public final func applyAtLeastWidthConstraint(_ width: CGFloat) {
        self +>= (.width, width)
    }
    
    /**
     Sets the at most width of a view.
     - Parameter width: A CGFloat value.
     */
    public final func applyAtMostWidthConstraint(_ width:CGFloat) {
        self +<= (.width, width)
    }
    
}

// MARK : - TO APPLIED PREPARED CONSTRAINTS
extension View
{
    // All the below methods of this category are used to applied\add constraints in supreview of receiver view (self)
    /**
     A receiver view is aligned from the left with padding.
     - Parameter padding: A CGFloat value to the left side padding.
     */
    public final func applyLeftPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .left).constant = padding
    }
    
    /**
     A receiver view is aligned from the right with padding.
     - Parameter padding: A CGFloat value to the right side padding.
     */
    public final func applyRightPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .right).constant = padding
    }
    
    /**
     A receiver view is aligned from the top with padding.
     - Parameter padding: A CGFloat value to the top side padding.
     */
    public final func applyTopPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .top).constant = padding
    }

    /**
     A receiver view is aligned from the bottom with padding.
     - Parameter padding: A CGFloat value to the bottom side padding.
     */
    public final func applyBottomPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .bottom).constant = padding
    }
    
    /**
     A receiver view is aligned from the left with padding.
     - Parameter padding: A CGFloat value to the left side padding.
     */
    public final func applyLeadingPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .leading).constant = padding
    }

    /**
     A receiver view is aligned from the right with padding.
     - Parameter padding: A CGFloat value to the right side padding.
     */
    public final func applyTrailingPinConstraintToSuperview(_ padding: CGFloat) {
        (self +== .trailing).constant = padding
    }
    
    /**
     To horizontally Center a receiver view in it's superview with an optional offset value.
     - Parameter offset: A CGFloat value for the offset along the x axis.
     */
    public final func applyCenterXPinConstraintToSuperview(_ offsetX: CGFloat) {
        (self +== .centerX).constant = offsetX
    }
    
    /// To Vertically Center In Superview
    /**
     To vertically Center a receiver view in it's superview with an optional offset value.
     - Parameter offset: A CGFloat value for the offset along the y axis.
     */
    public final func applyCenterYPinConstraintToSuperview(_ offsetY: CGFloat) {
        (self +== .centerY).constant = offsetY
    }
    
}

// MARK: - TO APPLY PREPARED CONSTRAINTS FOR CENTERING VIEW

extension View
{
    /// Centers the view horizontally in its superview with an optional offset.
    /// - Parameter offset: A CGFloat value for the offset along the x axis.
    public final func applyCenterHorizontallyInSuperview(_ offsetX: CGFloat = 0) {
        (self +== .centerX).constant = offsetX
    }
    
    /// Centers the view vertically in its superview with an optional offset.
    /// - Parameter offset: A CGFloat value for the offset along the y axis.
    public final func applyCenterVerticallyInSuperview(_ offsetY: CGFloat = 0) {
        (self +== .centerY).constant = offsetY
    }
    
    /// Centers the view horizontally & vertically in its superview with an optional offset.
    /// - Parameter offset: A CGFloat value for the offset along the x & y axis.
    public final func applyConstraintToCenterInSuperview(_ offset:CGPoint = CGPoint.zero) {
        (self +== .centerX).constant = offset.x
        (self +== .centerY).constant = offset.y
    }

}

extension View
{
    /// To apply\add same leading, trailing, Top and Bottom pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the all side (left, right, top & bottm) padding between the receiver view & its superview.
    public final func applyConstraintFitToSuperview(_ padding: CGFloat = 0.0) {
        applyConstraintFitToSuperview(contentInset: EdgeInsets.edgeInset(CGFloat(0)))
    }
    
    /// To apply\add same leading and trailing pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the left & right side padding between the receiver view & its superview.
    public final func applyConstraintFitHorizontallyToSuperview(_ padding: CGFloat = 0.0) {
        (self +== .leading).constant  = padding
        (self +== .trailing).constant = padding
    }
    
    /// To apply\add same top and bottom pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the top & bottom side padding between the receiver view & its superview.
    public final func applyConstraintFitVerticallyToSuperview(_ padding: CGFloat = 0.0) {
        (self +== .top).constant    = padding
        (self +== .bottom).constant = padding
    }
    
    /// To apply\add same leading, trailing, top and bottom pin constraints to superview with optional content inset.
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
