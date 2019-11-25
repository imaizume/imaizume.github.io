import Foundation
import Html

let document: Node = .document(
  .html(
    .body(
      .h1("Welcome!"),
      .p("You’ve found our site!")
    )
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
