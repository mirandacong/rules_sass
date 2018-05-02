package(default_visibility = ["//visibility:public"])

load("//sass:sass.bzl", "multi_sass_binary")

# Import our shared colors and fonts so we can generate a CSS file.
multi_sass_binary(
    name = "glob_sass",
    srcs = glob(["**/*.scss"]),
    deps = [
        "//examples/shared:colors",
        "//examples/shared:fonts",
    ],
)
