## Unreleased

## 8.15.0

* Added support for Fedora 42 x86_64 and aarch64.

## 8.14.0

* Added Windows x64 support. This should work on Windows Server 2016+ and Windows 10+.
* Updated Boost to 1.82.0 for Windows only in order to fix a bug needed for buidling the Windows agent. https://github.com/boostorg/locale/commit/41868c62a0519799696b544518f1efd831ff71c2
* Fixed issue on Fedora 41 with dnf5. We were using deprecated yum flags -d and -e. Since we don't support anything older than EL7, in which these were already deprecated, they have been removed.

## 8.13.0

* Added MacOS 15 (Sequoia) ARM64 support. No changes to other OS packages. Downloads for MacOS builds can be found at https://artifacts.overlookinfratech.com/#macos/

## 8.12.1

* Fix version in puppet component

## 8.12.0

* Make builds reproducible
* Add conflicts/replaces metadata on puppet-agent
* Update branding text to OpenVox in various commands
* Update rexml to 3.4.1 to address CVE-2024-49761
* Update curl to 8.12.1 to address CVE-2025-0167, CVE-2025-0665, and CVE-2025-0725, even though it should not affect OpenVox
* Update semantic_puppet to 1.1.1 to fix a typo in a method name
* Update Ruby to 3.2.7
* Add support for Fedora 41 (x86_64 and aarch64)

## 8.11.0

* Initial openvox-agent release. Based on Puppet 8.10.0, with additional support for fedora-40-aarch64, el-10-x86_64, and el-10-aarch64.
