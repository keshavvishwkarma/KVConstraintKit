//
//  KVConstraintKit+Hierarchy.swift
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

/// MARK: TO PREPARE VIEW HIERARCHY

extension View
{
    /// Adds the specified views or layout guides to the receiver's view.
    ///
    /// If `autoLayoutViews` are view's objects then it also sets 'translatesAutoresizingMaskIntoConstraints = false', for all `autoLayoutViews`.
    /// After the views or guides have been added to a view, it can participate in Auto Layout constraints with that view’s hierarchy.
    ///
    /// ```
    /// class CustomView: UIView {
    ///     let lineView    = UIView()
    ///     let textField   = UITextField()
    ///     let layoutGuide = UILayoutGuide()
    ///
    ///     convenience init() {
    ///         self.init(frame: CGRect.zero)
    ///
    ///         self.addAutoLayoutViews(
    ///             lineView,
    ///             textField,
    ///             layoutGuide
    ///         )
    ///         // OR Using + operator as a shortcut for `addAutoLayoutViews` method.
    ///         self + [
    ///             lineView,
    ///             textField,
    ///             layoutGuide
    ///         ]
    ///         ...
    ///     }
    /// }
    /// ```
    /// - Parameter autoLayoutViews : The `autoLayoutViews` can be list of view or layout guide
    ///   which will be added in receiver view.

    @discardableResult public func addAutoLayoutViews(_ autoLayoutViews : AutoLayoutView...) -> View {
        autoLayoutViews.forEach { self + $0 }; return self
    }
    
    /// This is just a shortcut to `addAutoLayoutViews`
    @discardableResult public static func +(lhs: View, rhs: [AutoLayoutView]) -> View {
        rhs.forEach { lhs + $0 } ; return lhs
    }
    
}


