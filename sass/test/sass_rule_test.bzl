# Copyright 2015 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"Tests for Sass bzl definitions"

load("@bazel_tools//tools/build_rules:test_rules.bzl", "file_test", "rule_test")

def _sass_binary_test(package):
    rule_test(
        name = "hello_world_rule_test",
        generates = ["main.css", "main.css.map"],
        rule = package + "/hello_world:hello_world",
    )

    rule_test(
        name = "no_sourcemap_rule_test",
        generates = ["main-no-sourcemap.css"],
        rule = package + "/hello_world:hello_world_no_sourcemap",
    )

    file_test(
        name = "no_sourcemap_file_test",
        file = package + "/hello_world:hello_world_no_sourcemap",
        regexp = "sourceMappingURL=",
        matches = 0,
    )

    rule_test(
        name = "nested_rule_test",
        generates = ["dir/main.css", "dir/main.css.map"],
        rule = package + "/nested:nested",
    )

def sass_rule_test(package):
    """Issue simple tests on sass rules."""
    _sass_binary_test(package)
