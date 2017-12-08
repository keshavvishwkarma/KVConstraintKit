//
//  KVConstraintKit+Size.swift
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
    @discardableResult public final func applyAspectRatio() -> View {
        self +== (.aspectRatio, 0); return self
    }
    
    /// Sets the width of a view.
    /// - Parameter width: A CGFloat value.
    @discardableResult public final func applyWidth(_ width: CGFloat) -> View {
        self +== (.width, width); return self
    }
    
    /// Sets the height of a view.
    /// - Parameter height: A CGFloat value.
    @discardableResult public final func applyHeight(_ height: CGFloat) -> View {
        self +== (.height, height); return self
    }
    
    /// Sets the at least height of a view.
    /// - Parameter height: A CGFloat value.
    @discardableResult public final func applyAtLeastHeight(_ height: CGFloat) -> View {
        self +>= (.height, height); return self
    }
    
    /// Sets the at most height of a view.
    /// - Parameter height: A CGFloat value.
    @discardableResult public final func applyAtMostHeight(_ height: CGFloat) -> View {
        self +<= (.height, height); return self
    }
    
    /// Sets the at least width of a view.
    /// - Parameter width: A CGFloat value.
    @discardableResult public final func applyAtLeastWidth(_ width: CGFloat) -> View {
        self +>= (.width, width); return self
    }
    
    /// Sets the at most width of a view.
    /// - Parameter width: A CGFloat value.
    @discardableResult public final func applyAtMostWidth(_ width: CGFloat) -> View {
        self +<= (.width, width); return self
    }
    
}

