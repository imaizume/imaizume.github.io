import Foundation
import Html

let description: String = "A brief introduction about imaizume."
let title: String = "imaizume"
let image: String = "https://www.imaizu.me/img/icon.png"
let styles: StaticString = """
html {
font-size: 16px;
}

body {
background-color: #eee;
font-family: 'Noto Sans JP', sans-serif;
margin: 0;
width: 100%;
}
.circle {
border-radius: 50%;
}
.container {
max-width: 960px;
margin: 0 auto;
}
h1 {
font-size: 4rem;
}
h1:before {
content: '@'
}
h2 {
display: inline-block;
font-size: 2rem;
margin: 0 auto;
}
.header-icon {
max-width: 200px;
}
.area {
padding: 2rem 0;
}
.contact-icon {
width: 5rem;
}
.contact-list {
list-style: none;
display: flex;
flex-flow: wrap;
justify-content: space-evenly;
padding: 0;
li {
display: inline-block;
}
.qiita {
border: 2px solid #5a8d4e;
box-sizing: border-box;
}
}
"""

let head: ChildOf = .head(
    .title(title),
    .link(attributes: [.init("href", "https://fonts.googleapis.com/css?family=Noto+Sans+JP"), .init("rel", "stylesheet")]),

    // Basic meta tags
    .meta(title: title),
    .meta(description: description),
    .meta(keywords: ["imaizume", "introduction", "profile", "contact"]),
    .meta(robots: ["index", "follow"]),
    .meta(contentType: .text(.html, charset: .utf8)),
    .meta(property: "charset", content: "UTF-8"),
    .meta(author: "Tomohiro Imaizumi"),

    // Google / Search Engine Tags
    .meta(itemprop: "name", content: title),
    .meta(itemprop: "description", content: description),
    .meta(itemprop: "image", content: image),

    // Facebook Meta Tags
    .meta(ogp: .facebook, property: "app_id", content: "236951083725770"),
    .meta(ogp: .ogp, property: "url", content: "https://www.imaizu.me"),
    .meta(ogp: .ogp, property: "title", content: title),
    .meta(ogp: .ogp, property: "description", content: description),
    .meta(ogp: .ogp, property: "image", content: image),

    // Twitter Meta Tags
    .meta(ogp: .twitter, property: "card", content: "summary_large_image"),
    .meta(ogp: .twitter, property: "title", content: title),
    .meta(ogp: .twitter, property: "description", content: description),
    .meta(ogp: .twitter, property: "image", content: image),

    .style(safe: styles)
)

let body: ChildOf = .body(
    .div(attributes: [.class("container")],
         .section(attributes: [.class("area")],
                  .div(attributes: [.style(safe: "width: 100%; text-align: center;")],
                       .img(src: "./img/icon.png", alt: "imaizume icon", attributes: [.class("header-icon")]),
                       .h1("imaizume")
            ),
                  .div(attributes: [.style(safe: "width: 80%; margin: 0 auto;")],
                       .ul(
                        .li(
                            .a(attributes: [.href("http://diverse-inc.co.jp/")],
                               "Diverse.inc"),
                            .span(attributes: [.style(safe: "margin-left: .5em;")], "(2017~)"),
                            .ul(
                                .li(
                                    .a(attributes: [.init("href", "https://poiboy.jp/")],
                                       "Poiboy iOS"),
                                    .span(attributes: [.style(safe: "margin-left: .5em;")], "iOS Programmer")
                                )
                            )
                        )))

        ),
         .section(attributes: [.class("area")], "b")
    )
)

let document: Node = .document(
    .html(attributes: [.lang(.ja)],
          head, body
    )
)

if #available(OSX 10.12, *) {
    if let homedir = FileManager.default.homeDirectory(forUser: "imaizume") {
        let filePath = homedir
            .appendingPathComponent("go")
            .appendingPathComponent("src")
            .appendingPathComponent("github.com")
            .appendingPathComponent("imaizume")
            .appendingPathComponent("imaizume.github.io")
            .appendingPathComponent("_index.html")

        let text: String = render(document)

        do {
            print("testing")
            try text.write(to: filePath, atomically: true, encoding: .utf8)
        } catch {
            print("error")
        }
    }
} else {
    // Fallback on earlier versions
}

// Open in Xcode: https://www.raywenderlich.com/1993018-an-introduction-to-swift-package-manager
