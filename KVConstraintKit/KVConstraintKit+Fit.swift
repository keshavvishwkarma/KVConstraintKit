//
//  KVConstraintKit+Fit.swift
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

extension View
{
    /// To apply\add same leading, trailing, Top and Bottom pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the all side (left, right, top & bottm) padding between the receiver view & its superview.
    @available(*, deprecated: 1.2, message: "Use 'fitToSuperview' instead")
    @discardableResult public final func applyConstraintFitToSuperview(_ padding: CGFloat ) -> View {
        return fitToSuperview(padding)
    }
    
    /// To apply\add same leading and trailing pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the left & right side padding between the receiver view & its superview.
    @available(*, deprecated: 1.2, message: "Use 'fitHorizontallyToSuperview' instead")
    @discardableResult public final func applyConstraintFitHorizontallyToSuperview(_ padding: CGFloat = 0.0) -> View {
        return fitVerticallyToSuperview(padding)
    }
    
    /// To apply\add same top and bottom pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the top & bottom side padding between the receiver view & its superview.
    @available(*, deprecated: 1.2, message: "Use 'fitVerticallyToSuperview' instead")
    @discardableResult public final func applyConstraintFitVerticallyToSuperview(_ padding: CGFloat = 0.0) -> View {
        return fitVerticallyToSuperview(padding)
    }
    
    /// To apply\add same leading, trailing, top and bottom pin constraints to superview with optional content inset.
    @available(*, deprecated: 1.2, message: "Use 'fitToSuperview(contentInset:)' instead")
    @discardableResult public final func applyConstraintFitToSuperview(contentInset inset:EdgeInsets = EdgeInsets.zero) -> View {
        return fitToSuperview(contentInset:inset)
    }
    
}

extension View
{
    /// To apply\add same leading, trailing, Top and Bottom pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the all side (left, right, top & bottm) padding between the receiver view & its superview.
    @discardableResult public final func fitToSuperview(_ padding: CGFloat ) -> View {
        return fitToSuperview(contentInset: EdgeInsets.edgeInset(padding))
    }
    
    /// To apply\add same leading and trailing pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the left & right side padding between the receiver view & its superview.
    @discardableResult public final func fitHorizontallyToSuperview(_ padding: CGFloat = 0.0) -> View {
        (self +== .leading).constant = padding; (self +== .trailing).constant = padding
        return self
    }
    
    /// To apply\add same top and bottom pin constraints to superview with same optional padding.
    /// - Parameter padding: A CGFloat value to the top & bottom side padding between the receiver view & its superview.
    @discardableResult public final func fitVerticallyToSuperview(_ padding: CGFloat = 0.0) -> View {
        (self +== .top).constant = padding ; (self +== .bottom).constant = padding
        return self
    }
    
    /// To apply\add same leading, trailing, top and bottom pin constraints to superview with optional content inset.
    @discardableResult public final func fitToSuperview(contentInset inset:EdgeInsets = EdgeInsets.zero) -> View {
        (self +== .top).constant      = inset.top
        (self +== .bottom).constant   = inset.bottom
        (self +== .leading).constant  = inset.left
        (self +== .trailing).constant = inset.right
        return self
    }
}
