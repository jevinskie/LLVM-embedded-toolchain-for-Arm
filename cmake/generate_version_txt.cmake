execute_process(
    COMMAND git -C ${llvmproject_SOURCE_DIR} rev-parse HEAD
    OUTPUT_VARIABLE llvmproject_COMMIT
    OUTPUT_STRIP_TRAILING_WHITESPACE
    COMMAND_ERROR_IS_FATAL ANY
)

if (${LLVM_TOOLCHAIN_LIBC} STREQUAL "picolibc")
    execute_process(
        COMMAND git -C ${picolibc_SOURCE_DIR} rev-parse HEAD
        OUTPUT_VARIABLE picolibc_COMMIT
        OUTPUT_STRIP_TRAILING_WHITESPACE
        COMMAND_ERROR_IS_FATAL ANY
    )
endif()

if (${LLVM_TOOLCHAIN_LIBC} STREQUAL "musl")
    execute_process(
        COMMAND git -C ${musl_SOURCE_DIR} rev-parse HEAD
        OUTPUT_VARIABLE musl_COMMIT
        OUTPUT_STRIP_TRAILING_WHITESPACE
        COMMAND_ERROR_IS_FATAL ANY
    )
endif()

configure_file(
    ${CMAKE_CURRENT_LIST_DIR}/VERSION.txt.in
    ${CMAKE_CURRENT_BINARY_DIR}/VERSION.txt
)
