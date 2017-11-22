//
// ApplyViewConstraint.swift
//  https://github.com/keshavvishwkarma/KVConstraintKit.git
//
//  Distributed under the MIT License.
//
//  Copyright © 2016-2017 Keshav Vishwkarma <keshavvbe@gmail.com>. All rights reserved.
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
    @available(*, deprecated: 1.2, message: "Use 'applyAspectRatio' instead")
    @discardableResult public final func applyAspectRatioConstraint() -> View {
        return applyAspectRatio()
    }
    
    /// Sets the width of a view.
    /// - Parameter width: A CGFloat value.
    @available(*, deprecated: 1.2, message: "Use 'applyWidth' instead")
    @discardableResult public final func applyWidthConstraint(_ width: CGFloat) -> View {
        return applyWidth(width)
    }
    
    /// Sets the height of a view.
    /// - Parameter height: A CGFloat value.
    @available(*, deprecated: 1.2, message: "Use 'applyHeight' instead")
    @discardableResult public final func applyHeightConstraint(_ height: CGFloat) -> View {
        return applyHeight(height)
    }
    
    /// Sets the at least height of a view.
    /// - Parameter height: A CGFloat value.
    @available(*, deprecated: 1.2, message: "Use 'applyAtLeastHeight' instead")
    @discardableResult public final func applyAtLeastHeightConstraint(_ height: CGFloat) -> View {
        return applyAtLeastHeight(height)
    }
    
    /// Sets the at most height of a view.
    /// - Parameter height: A CGFloat value.
    @available(*, deprecated: 1.2, message: "Use 'applyAtMostHeight' instead")
    @discardableResult public final func applyAtMostHeightConstraint(_ height: CGFloat) -> View {
        return applyAtMostHeight(height)
    }
    
    /// Sets the at least width of a view.
    /// - Parameter width: A CGFloat value.
    @available(*, deprecated: 1.2, message: "Use 'applyAtLeastWidth' instead")
    @discardableResult public final func applyAtLeastWidthConstraint(_ width: CGFloat) -> View {
        return applyAtLeastWidth(width)
    }
    
    /// Sets the at most width of a view.
    /// - Parameter width: A CGFloat value.
    @available(*, deprecated: 1.2, message: "Use 'applyAtMostWidth' instead")
    @discardableResult public final func applyAtMostWidthConstraint(_ width: CGFloat) -> View {
        return applyAtMostWidth(width)
    }
    
}


// MARK : - TO APPLIED PREPARED CONSTRAINTS

extension View
{
    // All the below methods of this category are used to applied\add constraints in supreview of receiver view (self)
    
    /// A receiver view is aligned from the left with padding.
    /// - Parameter padding: A CGFloat value to the left side padding.
    @available(*, deprecated: 1.2, message: "Use 'applyLeft' instead")
    @discardableResult public final func applyLeftPinConstraintToSuperview(_ padding: CGFloat) -> View {
        return applyLeft(padding)
    }
    
    /// A receiver view is aligned from the right with padding.
    /// - Parameter padding: A CGFloat value to the right side padding.
    @available(*, deprecated: 1.2, message: "Use 'applyRight' instead")
    @discardableResult public final func applyRightPinConstraintToSuperview(_ padding: CGFloat) -> View {
        return applyRight(padding)
    }
    
    /// A receiver view is aligned from the top with padding.
    /// - Parameter padding: A CGFloat value to the top side padding.
    @available(*, deprecated: 1.2, message: "Use 'applyTop' instead")
    @discardableResult public final func applyTopPinConstraintToSuperview(_ padding: CGFloat) -> View {
        return applyTop(padding)
    }
    
    /// A receiver view is aligned from the bottom with padding.
    /// - Parameter padding: A CGFloat value to the bottom side padding.
    @available(*, deprecated: 1.2, message: "Use 'applyBottom' instead")
    @discardableResult public final func applyBottomPinConstraintToSuperview(_ padding: CGFloat) -> View {
        return applyBottom(padding)
    }
    
    /// A receiver view is aligned from the left with padding.
    /// - Parameter padding: A CGFloat value to the left side padding.
    @available(*, deprecated: 1.2, message: "Use 'applyLeading' instead")
    @discardableResult public final func applyLeadingPinConstraintToSuperview(_ padding: CGFloat) -> View {
        return applyLeading(padding)
    }
    
    /// A receiver view is aligned from the right with padding.
    /// - Parameter padding: A CGFloat value to the right side padding.
    @available(*, deprecated: 1.2, message: "Use 'applyTrailing' instead")
    @discardableResult public final func applyTrailingPinConstraintToSuperview(_ padding: CGFloat) -> View {
        return applyTrailing(padding)
    }
    
    /// To horizontally Center a receiver view in it's superview with an optional offset value.
    /// - Parameter offsetX: A CGFloat value for the offset along the x axis.
    @available(*, deprecated: 1.2, message: "Use 'applyCenterX' instead")
    @discardableResult public final func applyCenterXPinConstraintToSuperview(_ offsetX: CGFloat) -> View {
        return applyCenterX(offsetX)
    }
    
    /// To vertically Center a receiver view in it's superview with an optional offset value.
    /// - Parameter offsetY: A CGFloat value for the offset along the y axis.
    @available(*, deprecated: 1.2, message: "Use 'applyCenterY' instead")
    @discardableResult public final func applyCenterYPinConstraintToSuperview(_ offsetY: CGFloat) -> View {
        return applyCenterY(offsetY)
    }
    
}

// MARK: - TO APPLY PREPARED CONSTRAINTS FOR CENTERING VIEW

extension View
{
    /// Centers the view horizontally in its `superview` with an optional offset.
    /// - Parameter offsetX: A CGFloat value for the offset along the x axis.
    /// - Returns: Itself, enabling chaining.
    @available(*, deprecated: 1.2, message: "Use 'applyCenterX' instead")
    public final func applyConstraintToCenterHorizontallyInSuperview(_ offsetX: CGFloat = 0) -> View {
        return applyCenterX(offsetX)
    }
    
    /// Centers the view vertically in its superview with an optional offset.
    /// - Parameter offsetY: A CGFloat value for the offset along the y axis
    /// - Returns: Itself, enabling chaining.
    @available(*, deprecated: 1.2, message: "Use 'applyCenterY' instead")
    public final func applyConstraintToCenterVerticallyInSuperview(_ offsetY: CGFloat = 0) -> View {
        return applyCenterY(offsetY)
    }
    
    /// Centers the view horizontally & vertically in its superview with an optional offset.
    /// - Parameter offset: A CGFloat value for the offset along the x & y axis.
    /// - Returns: Itself, enabling chaining.
    @available(*, deprecated: 1.2, message: "Use 'centerInSuperview' instead")
    public final func applyConstraintToCenterInSuperview(_ offset:CGPoint = CGPoint.zero) -> View {
        return centerInSuperview()
    }
    
}

extension View
{
    /// To apply\add same leading, trailing, Top and Bottom pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the all side (left, right, top & bottm) padding between the receiver view & its superview.
    @available(*, deprecated: 1.2, message: "Use 'fitToSuperview' instead")
    @discardableResult public final func applyConstraintFitToSuperview(_ padding: CGFloat = 0) -> View {
        return fitToSuperview(padding)
    }
    
    /// To apply\add same leading and trailing pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the left & right side padding between the receiver view & its superview.
    @available(*, deprecated: 1.2, message: "Use 'fitHorizontallyToSuperview' instead")
    @discardableResult public final func applyConstraintFitHorizontallyToSuperview(_ padding: CGFloat = 0) -> View {
        return fitVerticallyToSuperview(padding)
    }
    
    /// To apply\add same top and bottom pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the top & bottom side padding between the receiver view & its superview.
    @available(*, deprecated: 1.2, message: "Use 'fitVerticallyToSuperview' instead")
    @discardableResult public final func applyConstraintFitVerticallyToSuperview(_ padding: CGFloat = 0) -> View {
        return fitVerticallyToSuperview(padding)
    }
    
    /// To apply\add same leading, trailing, top and bottom pin constraints to superview with optional content inset.
    @available(*, deprecated: 1.2, message: "Use 'fitToSuperview(contentInset:)' instead")
    @discardableResult public final func applyConstraintFitToSuperview(contentInset inset:EdgeInsets) -> View {
        return fitToSuperview(contentInset:inset)
    }
    
}
