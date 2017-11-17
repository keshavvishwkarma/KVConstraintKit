//
//  KVConstraintKit+Pin.swift
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

// MARK : - TO APPLIED PREPARED CONSTRAINTS

extension View
{
    // All the below methods of this category are used to applied\add constraints in supreview of receiver view (self)
    
    /// A receiver view is aligned from the left with padding.
    /// - Parameter padding: A CGFloat value to the left side padding.
    @available(*, deprecated: 1.2, message: "Use 'applyLeft' instead", renamed: "applyLeft")
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

extension View
{
    // All the below methods of this category are used to applied\add constraints in supreview of receiver view (self)
    
    /// A receiver view is aligned from the left with padding.
    /// - Parameter padding: A CGFloat value to the left side padding.
    @discardableResult public final func applyLeft(_ padding: CGFloat) -> View {
        (self +== .left).constant = padding ; return self
    }
    
    /// A receiver view is aligned from the right with padding.
    /// - Parameter padding: A CGFloat value to the right side padding.
    @discardableResult public final func applyRight(_ padding: CGFloat) -> View {
        (self +== .right).constant = padding ; return self
    }
    
    /// A receiver view is aligned from the top with padding.
    /// - Parameter padding: A CGFloat value to the top side padding.
    @discardableResult public final func applyTop(_ padding: CGFloat) -> View {
        (self +== .top).constant = padding ; return self
    }
    
    /// A receiver view is aligned from the bottom with padding.
    /// - Parameter padding: A CGFloat value to the bottom side padding.
    @discardableResult public final func applyBottom(_ padding: CGFloat) -> View {
        (self +== .bottom).constant = padding ; return self
    }
    
    /// A receiver view is aligned from the left with padding.
    /// - Parameter padding: A CGFloat value to the left side padding.
    @discardableResult public final func applyLeading(_ padding: CGFloat) -> View {
        (self +== .leading).constant = padding ; return self
    }
    
    /// A receiver view is aligned from the right with padding.
    /// - Parameter padding: A CGFloat value to the right side padding.
    @discardableResult public final func applyTrailing(_ padding: CGFloat) -> View {
        (self +== .trailing).constant = padding ; return self
    }
    
    /// To horizontally Center a receiver view in it's superview with an optional offset value.
    /// - Parameter offsetX: A CGFloat value for the offset along the x axis.
    @discardableResult public final func applyCenterX(_ offsetX: CGFloat) -> View {
        (self +== .centerX).constant = offsetX ; return self
    }
    
    /// To vertically Center a receiver view in it's superview with an optional offset value.
    /// - Parameter offsetY: A CGFloat value for the offset along the y axis.
    @discardableResult public final func applyCenterY(_ offsetY: CGFloat) -> View {
        (self +== .centerY).constant = offsetY ; return self
    }
    
    
}




