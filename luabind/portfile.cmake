
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ryzom/luabind
    REF 0ae9bd6e40fe6c70e9d032ff096370929f58c143
    SHA512 811f865855d4b44f086a4deb7ce38dcc42de3149b0509f0aa211dd850cd661639a2cf05b47b84bcd42b69cd6c3a998df52208ab037e4f923869b1e9e79a0d326
    HEAD_REF main
)

vcpkg_cmake_configure(
	SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
#vcpkg_cmake_config_fixup()
vcpkg_copy_pdbs()

# release build already hasse these
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/CMake")

file(
	INSTALL "${SOURCE_PATH}/LICENSE.txt"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright
)

