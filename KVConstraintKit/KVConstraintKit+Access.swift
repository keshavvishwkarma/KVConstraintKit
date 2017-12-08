//
//  KVConstraintKit+Acces.swift
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

// MARK : - TO ACCEESS APPLIED CONSTRAINTS

public extension View {
    
    public var leftConstraint     : NSLayoutConstraint? { return self <- .left     }
    public var rightConstraint    : NSLayoutConstraint? { return self <- .right    }
    public var leadingConstraint  : NSLayoutConstraint? { return self <- .leading  }
    public var trailingConstraint : NSLayoutConstraint? { return self <- .trailing }
    public var topConstraint      : NSLayoutConstraint? { return self <- .top      }
    public var bottomConstraint   : NSLayoutConstraint? { return self <- .bottom   }
    public var centerXConstraint  : NSLayoutConstraint?  { return self <- .centerX }
    public var centerYConstraint  : NSLayoutConstraint?  { return self <- .centerY }
    
    public var heightConstraint   : NSLayoutConstraint? { return self <- .height   }
    public var widthConstraint    : NSLayoutConstraint? { return self <- .width    }
    
    #if os(iOS) || os(tvOS)
    
    public var leftMarginConstraint     : NSLayoutConstraint? { return self <- .leftMargin     }
    public var rightMarginConstraint    : NSLayoutConstraint? { return self <- .rightMargin    }
    public var leadingMarginConstraint  : NSLayoutConstraint? { return self <- .leadingMargin  }
    public var trailingMarginConstraint : NSLayoutConstraint? { return self <- .trailingMargin }
    public var topMarginConstraint      : NSLayoutConstraint? { return self <- .topMargin      }
    public var bottomMarginConstraint   : NSLayoutConstraint? { return self <- .bottomMargin   }
    
    public var centerXWithinMarginsConstraint : NSLayoutConstraint? { return self <- .centerXWithinMargins }
    public var centerYWithinMarginsConstraint : NSLayoutConstraint? { return self <- .centerYWithinMargins }
    
    #endif
    
}
