// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LicensePlistsMergerPlugin",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .plugin(
            name: "LicensePlistsMergerPlugin",
            targets: ["LicensePlistsMergerPlugin"]),
    ],
    targets: [
        .plugin(
            name: "LicensePlistsMergerPlugin",
            capability: .command(
                intent: .custom(verb: "license-plists-merger", description: "merge license plists"),
                permissions: [
                    .writeToPackageDirectory(reason: "output license files.")
                ]
            ),
            dependencies: [.target(name: "license-plists-merger")]
        ),
        .binaryTarget(name: "license-plists-merger", url: "https://github.com/ubiregiinc/LicensePlistsMerger/releases/download/0.3.1/license-plists-merger-macos.artifactbundle.zip", checksum: "20e77c74c695b9a1f267a14841b3fc2ccdf2b667ae1d545889f6729ea9cd28ce"),
    ]
)
