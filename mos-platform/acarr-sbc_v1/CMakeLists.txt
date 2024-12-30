platform(acarr-sbc_v1 COMPLETE PARENT common)


if(NOT CMAKE_CROSSCOMPILING)
  return()
endif()

install(FILES link.ld TYPE LIB)

add_platform_library(acarr-sbc_v1-crt0
  crt0/reset.s
)
merge_libraries(acarr-sbc_v1-crt0
  common-crt0
  common-init-stack
  common-copy-data
  common-zero-bss
  common-exit-loop
)

target_compile_options(acarr-sbc_v1-crt0 PUBLIC -mcpu=mosw65c02)
target_link_libraries(acarr-sbc_v1-crt0 PRIVATE common-asminc)
