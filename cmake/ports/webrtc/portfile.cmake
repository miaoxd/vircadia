include(vcpkg_common_functions)
set(WEBRTC_VERSION 20210105)
set(MASTER_COPY_SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src)

file(READ "${VCPKG_ROOT_DIR}/_env/EXTERNAL_BUILD_ASSETS.txt" EXTERNAL_BUILD_ASSETS)

if (ANDROID)
   # this is handled by hifi_android.py
elseif (WIN32)
    vcpkg_download_distfile(
        WEBRTC_SOURCE_ARCHIVE
        URLS "${EXTERNAL_BUILD_ASSETS}/dependencies/vcpkg/webrtc-m84-20210105-windows.zip"
        SHA512 12847f7e9df2e0539a6b017db88012a8978b1aa37ff2e8dbf019eb7438055395fdda3a74dc669b0a30330973a83bc57e86eca6f59b1c9eff8e2145a7ea4a532a
        FILENAME webrtc-m84-20210105-windows.zip
    )
elseif (APPLE)
    vcpkg_download_distfile(
        WEBRTC_SOURCE_ARCHIVE
        URLS "${EXTERNAL_BUILD_ASSETS}/seth/webrtc-m78-osx.tar.gz"
        SHA512 8b547da921cc96f5c22b4253a1c9e707971bb627898fbdb6b238ef1318c7d2512e878344885c936d4bd6a66005cc5b63dfc3fa5ddd14f17f378dcaa17b5e25df
        FILENAME webrtc-m78-osx.tar.gz
    )
else ()
    # else Linux desktop
    vcpkg_download_distfile(
        WEBRTC_SOURCE_ARCHIVE
        URLS "${EXTERNAL_BUILD_ASSETS}/dependencies/vcpkg/webrtc-m84-gcc-linux.tar.xz"
        SHA512 13f311f0d6b8fc986e1f6eea426030e6ad961c98d012d79a66eb263b923c5a4894553c55f793cf70a3a7af6cd2252e733ead9eb54e24d729e2f73c2426b39a55
        FILENAME webrtc-m84-gcc-linux.tar.xz
    )
endif ()

vcpkg_extract_source_archive(${WEBRTC_SOURCE_ARCHIVE})

file(COPY ${MASTER_COPY_SOURCE_PATH}/webrtc/include DESTINATION ${CURRENT_PACKAGES_DIR})
file(COPY ${MASTER_COPY_SOURCE_PATH}/webrtc/lib DESTINATION ${CURRENT_PACKAGES_DIR})
file(COPY ${MASTER_COPY_SOURCE_PATH}/webrtc/share DESTINATION ${CURRENT_PACKAGES_DIR})
file(COPY ${MASTER_COPY_SOURCE_PATH}/webrtc/debug DESTINATION ${CURRENT_PACKAGES_DIR})
