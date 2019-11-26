//
//  extensions.swift
//  imaizume.github.io
//
//  Created by Tomohiro Imaizumi on 2019/11/27.
//

import Foundation
import Html

extension ChildOf where Element == Tag.Head {
    public static func meta(itemprop: String, content: String) -> ChildOf {
        return meta(attributes: [.init("itemprop", itemprop), .content(content)])
    }

    public static func meta(ogp: OgpType, property: String, content: String) -> ChildOf {
        return meta(attributes: [.init("\(ogp.rawValue):property", property), .content(content)])
    }

    public enum OgpType: String {
        case facebook = "fb"
        case twitter
        case ogp = "og  "
    }

    public static func meta(title: String) -> ChildOf {
        return meta(attributes: [.init("title", title), .content(title)])
    }

    public static func meta(robots: [String]) -> ChildOf {
        let sanitizedRobots = robots.map { $0.replacingOccurrences(of: ",", with: "&#44;") }
        return meta(attributes: [.init("name", "robots"), .content(sanitizedRobots.joined(separator: ","))])
    }

    public static func meta(revisitAfterDays: Int) -> ChildOf {
        return meta(attributes: [.init("name", "revisit-after"), .content("\(revisitAfterDays) days")])
    }
}
