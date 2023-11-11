ExternalProject_Add(xxhash
    GIT_REPOSITORY https://github.com/Cyan4973/xxHash.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    GIT_TAG dev
    UPDATE_COMMAND ""
    GIT_REMOTE_NAME origin
    CONFIGURE_COMMAND ${EXEC} cmake -H<SOURCE_DIR>/cmake_unofficial -B<BINARY_DIR>
        -G Ninja
        -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
        -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}
        -DCMAKE_BUILD_TYPE=Release
        -DBUILD_SHARED_LIBS=OFF
        -DDISPATCH=ON
        -DCMAKE_C_FLAGS='${CMAKE_C_FLAGS} -DXXH_X86DISPATCH_ALLOW_AVX=1'
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(xxhash)
cleanup(xxhash install)
