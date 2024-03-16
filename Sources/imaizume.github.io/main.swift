import Foundation
import Html
import SwiftDate

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
    a { color: #02a8f4 }
    a:visited { color: #b867c6 }
    a:hover { color: #33b490 }
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

let gaScript: StaticString = """
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-T76ETZ5F27');
    """

public struct Item {
    let url: String
    let date: String
    let title: String
}

extension Item {
    static var talks: Node {
        let items: [Item] = [
            .init(
                url: "https://speakerdeck.com/imaizume/achieve-product-growth-and-tech-update",
                date: "2022/05/13",
                title:
                    "プロダクトグロースと技術のベースアップを両立させるRettyのアプリ開発スタイル / Achieve Product Growth and Tech Update - iOS Snack bar #1"
            ),
            .init(
                url: "https://retty.connpass.com/event/226111/", date: "2021/10/26",
                title: "スクラム開発におけるアプリチームの取り組み_Retty Beer Bash#5 - connpass"),
            .init(
                url: "http://bit.ly/2TyNHyh", date: "2020/01/07",
                title: "git branchを自由に操れるようになろう / Let's Play with Git branch!"),
            .init(
                url: "http://bit.ly/2pZYEwm", date: "2019/09/07",
                title: "スナップショットテスト実戦投入 / Practical Snapshot Testing - iOSDC Japan 2019"),
            .init(
                url: "http://bit.ly/2DsbEO9", date: "2019/07/17",
                title:
                    "コーディング以外のエンジニアリング / About Engineering Without Coding - Matcing Dev Meetup #4"),
            .init(
                url: "http://bit.ly/2Ys5UNv", date: "2019/06/18",
                title:
                    "Firebase Remote Configの運用で知ったこと・知っておくと良いこと / Things I Learned from Operation of Firebase Remote Config - potatotips #62"
            ),
            .init(
                url: "http://bit.ly/2QovAat", date: "2019/04/16",
                title:
                    "iOSアプリのテストを書きたいのに書けないあなたへ / How You Should Start to Write Your First Unit Test for iOS - iOS Test Night #10"
            ),
            .init(
                url: "http://bit.ly/2VYbtWL", date: "2019/04/10",
                title:
                    "循環的複雑度を上げないためのSwiftプログラミングTips / Tips of Swift Programming to Reduce Code Complexity - Otemachi.swift #3"
            ),
            .init(
                url: "http://bit.ly/2K5rfrA", date: "2019/03/07",
                title:
                    "シングルトンではじめる状態管理と依存注入 / A way to control state using singleton pattern - ROPPONGI.swift #7"
            ),
            .init(
                url: "http://bit.ly/2SKtZ2A", date: "2018/11/22",
                title: "『「改善Dayを作ろう!」って言ってたけど気づいたらなくなったよね…』を繰り返さないために - Diverse.tech #1"),
            .init(
                url: "http://bit.ly/2SD90uT", date: "2018/11/05",
                title: "(再演)きれいなcommit, pull requestを知りたい/作りたい方のためのgit勉強会 - サポーターズCoLab"),
            .init(
                url: "http://bit.ly/2MUGxyK", date: "2018/09/28",
                title: "チュートリアル実装の『そこどうしてる_』 Poiboyではこうしてる! - マッチングの裏側Night #1"),
            .init(
                url: "http://bit.ly/2DpZwga", date: "2018/09/14",
                title: "(再演) detached HEADを理解して脱Git初心者を目指す方のためのGit入門勉強会 - サポーターズCoLab"),
            .init(
                url: "http://bit.ly/2TEqI1H", date: "2018/08/24",
                title: "(ほぼ)標準ライブラリだけでスロットゲームを実装した話 - ROPPONGI.swift #5"),
            .init(
                url: "http://bit.ly/2Do6mmt", date: "2018/02/24",
                title: "必要性の力を借りて良い学習をする - Unitus LT会"),
            .init(
                url: "http://bit.ly/2UN7NlB", date: "2018/02/20",
                title: "新規サービスのアプリ開発で経験したリアルな出来事 - mixi GROUP Tech Meet ！"),
        ]
        let talks: [ChildOf<Tag.Ul>] =
            items
            .sorted(by: { $0.date > $1.date })
            .map { dataToNode(publishing: $0) }
        return .ul(.fragment(talks))
    }

    static var activityList: Node {
        let items: [Item] = [
            .init(
                url: "https://menta.work/plan/1549", date: "2022/01~",
                title:
                    "【初心者_未経験者歓迎】使い方から運用までGit&GitHubの困りごと何でも解決します! 単発でのご相談から体系的学習や継続的なコーチングもOK! _ MENTA"
            ),
            .init(
                url: "http://bit.ly/307DxnY", date: "2019/07~",
                title: "ココナラ - ビデオ版: Gitの困り事解決いたします 勉強会講師の経験有り 使い方から運用まで何でもどうぞ!｜その他（IT・プログラミング）"),
            .init(
                url: "http://bit.ly/2A3CJWN", date: "2018/11~",
                title:
                    "ココナラ - テキスト版: Gitの困り事何でも解決いたします 勉強会講師の経験有り ❗使い方から運用まで何でもどうぞ ❗｜その他（IT・プログラミング）"),
            .init(
                url: "http://bit.ly/2SiVXCZ", date: "2019/02",
                title: "6. 歴史あるサービスや文化との付き合い方（Diverse＝ダイバーシティって何？を掘り下げてみた） - Diverse Podcast"),
            .init(
                url: "http://bit.ly/2Bp1X2w", date: "2018/08",
                title:
                    "3. 「0→1」フェーズから「1→100」のフェーズに入ったサービスとの付き合い方（Poiboy iOSアプリの開発現場） - Diverse Podcast"
            ),
        ]
        let activities: [ChildOf<Tag.Ul>] =
            items
            .sorted(by: { $0.date > $1.date })
            .map { dataToNode(publishing: $0) }
        return .ul(.fragment(activities))
    }

    static var workList: Node {
        let items: [Item] = [
            .init(
                url: "https://github.com/imaizume/url-encode-decode-alfred-workflow",
                date: "2022/12/10",
                title:
                    "Alfred Workflow for URL Encode / Decode"
            ),
            .init(
                url: "https://cocoapods.org/pods/Boonary", date: "2019/11",
                title:
                    "Boonary: Simple extensions of conversion between Bool and Int values. - cocoapods.org"
            ),
            .init(
                url: "https://sukiyaki.imaasa.com/", date: "2015/09",
                title: "すき焼今朝 公式HP / Sukiyaki Imaasa Official Page"),
        ]
        let works: [ChildOf<Tag.Ul>] =
            items
            .sorted(by: { $0.date > $1.date })
            .map { dataToNode(publishing: $0) }
        return .ul(.fragment(works))
    }

    static private func dataToNode(publishing: Item) -> ChildOf<Tag.Ul> {
        .li(
            .a(
                attributes: [.href(publishing.url)],
                .text(publishing.title)),
            .span("(\(publishing.date))"))
    }
}

public struct BlogItem {
    let url: String
    let date: String
    let title: String
    let suffix: String
}

extension BlogItem {
    static var blogPosts: Node {
        let diverseTechBlogEntries: [BlogItem] = [
            .init(
                url: "https://developer.diverse-inc.com/search?q=imaizume", date: "2019/09/17",
                title: "過去記事",
                suffix: "Diverse Tech Blog"
            )
        ]
        let rettyTechBlogSuffix: String = "Retty Tech Blog"
        let rettyTechBlogEntries: [BlogItem] = [
            .init(
                url: "https://engineer.retty.me/entry/2019/12/16/120000", date: "2019/12/16",
                title: "Xcode 11でビルドしたRetty iOSアプリの検索バーが突然反応しなくなった訳",
                suffix: rettyTechBlogSuffix
            ),
            .init(
                url: "https://engineer.retty.me/entry/2020/05/08/115500", date: "2020/05/08",
                title: "Slack Workflowで定形的な報告業務を効率化したのでRettyでのノウハウを公開します!",
                suffix: rettyTechBlogSuffix
            ),
            .init(
                url: "https://engineer.retty.me/entry/2020/12/12/090000", date: "2020/12/12",
                title: "開発組織としてのRettyアプリチーム紹介と2020年振り返り - LeSSとリモート勤務の元でのより良い開発体制を目指して",
                suffix: rettyTechBlogSuffix
            ),
            .init(
                url: "https://engineer.retty.me/entry/2021/12/06/180000", date: "2021/12/06",
                title: "iOS 13と14をサポートするSwiftUIの実装でRettyアプリチームがハマったポイントまとめ",
                suffix: rettyTechBlogSuffix
            ),
            .init(
                url: "https://engineer.retty.me/entry/2022/04/15/120000", date: "2022/04/15",
                title: "ブランチ追従コストが大幅DOWN! RettyアプリチームがFeature Branchを捨てFeature Flagでの開発へ移行した理由と成果",
                suffix: rettyTechBlogSuffix
            ),
            .init(
                url: "https://engineer.retty.me/entry/2022/12/01/090000", date: "2022/12/01",
                title: "2年間の運用実績から学んだ! Retty流Slack Workflow活用術と使い方の勘所!",
                suffix: rettyTechBlogSuffix
            ),
            .init(
                url: "https://engineer.retty.me/entry/2023/12/14/173000", date: "2023/12/14",
                title: "日本全国で自社のサービスをドッグフーディングしてみて",
                suffix: rettyTechBlogSuffix
            ),
            .init(
                url: "https://engineer.retty.me/entry/2024/01/23/120000", date: "2024/01/23",
                title: "アプリ開発メインの私が業務で擦れるほど使い倒しているGit/GitHub CLIの便利コマンド4つ",
                suffix: rettyTechBlogSuffix
            ),
        ]
        let blogPosts: [ChildOf<Tag.Ul>] = (rettyTechBlogEntries + diverseTechBlogEntries)
            .sorted(by: { $0.date > $1.date })
            .map { dataToNode(publishing: $0) }
        return .ul(.fragment(blogPosts))
    }

    static private func dataToNode(publishing: BlogItem) -> ChildOf<Tag.Ul> {
        .li(
            .a(
                attributes: [.href(publishing.url)],
                .text("\(publishing.title) - \(publishing.suffix)")),
            .span("(\(publishing.date))"))
    }
}

struct SocialItem {
    let name: String
    let url: String
}

extension SocialItem {
    static var socialList: Node {
        let items: [SocialItem] = [
            .init(name: "Facebook", url: "https://facebook.com/imaizume/"),
            .init(name: "Twitter", url: "https://twitter.com/imaizume/"),
            .init(name: "note", url: "https://note.com/imaizume"),
            .init(name: "Blog", url: "https://blog.imaizu.me/"),
            .init(name: "Qiita", url: "https://qiita.com/imaizume/"),
            .init(name: "Zenn", url: "https://zenn.dev/imaizume"),
            .init(name: "GitHub", url: "https://github.com/imaizume/"),
            .init(name: "Retty", url: "https://user.retty.me/1010703/"),
        ]
        let socials: [ChildOf<Tag.Ul>] = items.map { dataToNode(social: $0) }
        return .ul(attributes: [.class("contact-list")], .fragment(socials))
    }

    static private func dataToNode(social: SocialItem) -> ChildOf<Tag.Ul> {
        .li(
            .a(
                attributes: [
                    .href(social.url), .class("circle"), .style(safe: "display: inline-block;"),
                ],
                .img(
                    src: "./img/\(social.name.lowercased()).png", alt: social.name,
                    attributes: [.class("circle contact-icon")])))
    }
}

let head: ChildOf = .head(
    .title(title),
    .link(attributes: [
        .init("href", "https://fonts.googleapis.com/css?family=Noto+Sans+JP"),
        .init("rel", "stylesheet"),
    ]),

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
    .meta(itemprop: "date", content: today),

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

var today: String {
    Date.init().toFormat("yyyy/MM/dd")
}

let body: ChildOf = .body(
    .div(
        attributes: [.class("container")],
        .section(
            attributes: [.class("area")],
            .div(
                attributes: [.style(safe: "width: 100%; text-align: center;")],
                .img(
                    src: "./img/icon.png", alt: "imaizume icon", attributes: [.class("header-icon")]
                ),
                .h1("imaizume"),
                .p(.text("Last Update: "), .time("\(today)"))),
            .div(
                attributes: [.style(safe: "width: 80%; margin: 0 auto;")],
                .ul(
                    .li(
                        .a(
                            attributes: [.href("https://corp.retty.me/")],
                            "Retty.inc"),
                        .span(attributes: [.style(safe: "margin-left: .5em;")], "(2019/11~)"),
                        .ul(
                            .li(.span(attributes: [], "iOS / Android Programmer")),
                            .li(.span(attributes: [], "Scrum Master")),
                            .li(.span(attributes: [], "Recruiter"))
                        )),
                    .li(
                        .a(
                            attributes: [.href("https://diverse-inc.co.jp/")],
                            "Diverse.inc"),
                        .span(
                            attributes: [.style(safe: "margin-left: .5em;")], "(2017/04~2019/10)"),
                        .ul(
                            .li(
                                .a(
                                    attributes: [.href("https://poiboy.jp/")],
                                    "Poiboy"),
                                .span(
                                    attributes: [.style(safe: "margin-left: .5em;")],
                                    "iOS Programmer"))
                        )),
                    .li(
                        .a(
                            attributes: [.href("https://mixi.co.jp/")],
                            "mixi.inc"),
                        .span(
                            attributes: [.style(safe: "margin-left: .5em;")], "(2015/08~2015/10)"),
                        .ul(
                            .li(
                                .a(
                                    attributes: [.href("https://mitene.us/")],
                                    "家族アルバム みてね"),
                                .span(
                                    attributes: [.style(safe: "margin-left: .5em;")],
                                    "Programmer Internship(2015)")))),
                    .li(
                        "Small (self confessed) Web Company : Frontend Coder Internship (2014~2015)"
                    ),
                    .li(
                        "Industorial Administration, Tokyo University of Science : Bachelor and Master Degree (2010~2017) "
                    )
                )
            )

        ),

        .section(
            attributes: [.class("area")],
            .div(
                attributes: [.style(safe: "text-align: center;")],
                .h2("Talks")),
            .div(
                attributes: [.style(safe: "width: 80%; margin: 0 auto;")],
                Item.talks)),
        .section(
            attributes: [.class("area")],
            .div(
                attributes: [.style(safe: "text-align: center;")],
                .h2("Activities")),
            .div(
                attributes: [.style(safe: "width: 80%; margin: 0 auto;")],
                Item.activityList)),
        .section(
            attributes: [.class("area")],
            .div(
                attributes: [.style(safe: "text-align: center;")],
                .h2("Posts")),
            .div(
                attributes: [.style(safe: "width: 80%; margin: 0 auto;")],
                BlogItem.blogPosts)),
        .section(
            attributes: [.class("area")],
            .div(
                attributes: [.style(safe: "text-align: center;")],
                .h2("Works")),
            .div(
                attributes: [.style(safe: "width: 80%; margin: 0 auto;")],
                Item.workList)),
        .section(
            attributes: [.class("area")],
            .div(
                attributes: [.style(safe: "text-align: center;")],
                .h2("Achievements")),
            .div(
                attributes: [.style(safe: "width: 80%; margin: 0 auto;")],
                .ul(
                    .li(
                        .text("Ruby技術者認定試験 Silver Version 2.1 (2016/12)"),
                        .br,
                        .img(
                            src:
                                "https://www.ruby.or.jp/assets/images/ja/certification/examination/logo_silver_v21.png",
                            alt: "Ruby Silver Logo", attributes: []))))),
        .section(
            attributes: [.class("area")],
            .div(
                attributes: [.style(safe: "text-align: center;")],
                .h2("Socials")),
            .div(
                attributes: [.style(safe: "width: 80%; margin: 0 auto;")],
                SocialItem.socialList)),
        .footer(
            attributes: [.style(unsafe: "text-align: center;")],
            .small(.text("Copyright ©; 2010-2019 Tomohiro Imaizumi All Rights Reserved.")))

    ),
    .script(attributes: [
        .async(true), .src("https://www.googletagmanager.com/gtag/js?id=G-T76ETZ5F27"),
    ]),
    .script(attributes: [
        .dataAdClient("ca-pub-1404916629967149"), .async(true),
        .src("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"),
    ]),
    .script(safe: gaScript)
)

let document: Node = .document(
    .html(
        attributes: [.lang(.ja)],
        head, body
    )
)

if #available(macOS 12.3, *) {  // Unable to detect current OS version properly in AppCode when use newer Swift API
    let homedir: URL = FileManager.default.homeDirectoryForCurrentUser
    let outputPath: String = render(document)
    let filePathComponent = [
        "go",
        "src",
        "github.com",
        "imaizume",
        "imaizume.github.io",
        "index.html",
    ].reduce(homedir) { $0.appendingPathComponent($1) }

    do {
        print("Updated index.html")
        try outputPath.write(to: filePathComponent, atomically: true, encoding: .utf8)
    } catch {
        print("error")
    }
}

// Open in Xcode: https://www.raywenderlich.com/1993018-an-introduction-to-swift-package-manager

extension Attribute where Element: HasSrc {
    /// data-ad-client
    ///
    /// - Parameter value: id.
    public static func dataAdClient(_ value: String) -> Attribute {
        .init("data-ad-client", value)
    }
}
