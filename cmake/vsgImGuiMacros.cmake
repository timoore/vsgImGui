macro(vsg_copy_imgui_headers)
    set(options)
    set(oneValueArgs )
    set(multiValueArgs FILES)
    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    foreach(FILE_TO_COPY ${ARGS_FILES})
        get_filename_component(FILENAME ${FILE_TO_COPY} NAME)

        execute_process(COMMAND ${CMAKE_COMMAND} -E compare_files ${CMAKE_SOURCE_DIR}/include/vsgImGui/${FILENAME} ${FILE_TO_COPY} RESULT_VARIABLE compare_result)
        if (compare_result EQUAL 0)
        else()
            file(COPY ${FILE_TO_COPY} DESTINATION ${CMAKE_SOURCE_DIR}/include/vsgImGui/)
            message("copied ${FILENAME}" )
        endif()
    endforeach()
endmacro()    
    