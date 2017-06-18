//
//  DownAttributedStringRenderable.swift
//  Down
//
//  Created by Rob Phillips on 6/1/16.
//  Copyright © 2016 Glazed Donut, LLC. All rights reserved.
//

import Foundation
import libcmark

public protocol DownAttributedStringRenderable: DownHTMLRenderable {
    /**
     Generates an `NSAttributedString` from the `markdownString` property

     - parameter options: `DownOptions` to modify parsing or rendering
     
     - parameter styling: add css `String` to modify content styling

     - throws: `DownErrors` depending on the scenario

     - returns: An `NSAttributedString`
     */
    
    func toAttributedString(_ options: DownOptions, styling: String) throws -> NSAttributedString
}

public extension DownAttributedStringRenderable {
    /**
     Generates an `NSAttributedString` from the `markdownString` property

     - parameter options: `DownOptions` to modify parsing or rendering, defaulting to `.Default`
     
     - parameter styling: add css `String` to modify content styling

     - throws: `DownErrors` depending on the scenario

     - returns: An `NSAttributedString`
     */
    
    public func toAttributedString(_ options: DownOptions = .Default, styling: String = "") throws -> NSAttributedString {
        let html = try self.toHTML(options)
        let htmlFinal = styling.appending(html)
        return try NSAttributedString(htmlString: htmlFinal)
    }
}
