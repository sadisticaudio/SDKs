
macro(setupAaxSupport)
    # AAX SDK Location
    if(SMTG_MAC OR SMTG_WIN)
        if(NOT SMTG_AAX_SDK_PATH)
            # Check if the AAX SDK is next to the VST3SDK:
            if(EXISTS "${SDK_ROOT}/../external.avid.aax/Interfaces/AAX.h")
                set(SMTG_AAX_SDK_PATH "${SDK_ROOT}/../external.avid.aax")
            else()
                if(EXISTS "${SDK_ROOT}/external.avid.aax/Interfaces/AAX.h")
                    set(SMTG_AAX_SDK_PATH "${SDK_ROOT}/external.avid.aax")
                endif()
            endif()
        else()
            if(NOT IS_ABSOLUTE ${SMTG_AAX_SDK_PATH})
                get_filename_component(SMTG_AAX_SDK_PATH "${SDK_ROOT}/${SMTG_AAX_SDK_PATH}" ABSOLUTE)
            endif()
            if(NOT EXISTS "${SMTG_AAX_SDK_PATH}/Interfaces/AAX.h")
                message(FATAL_ERROR "SMTG_AAX_SDK_PATH is set but does not point to an expected location!")
            endif()
        endif()
        if(SMTG_AAX_SDK_PATH)
            message(STATUS "SMTG_AAX_SDK_PATH is set to : " ${SMTG_AAX_SDK_PATH})
        else()
            message(STATUS "SMTG_AAX_SDK_PATH is not set. If you need it, please download the AAX SDK!")
        endif()
    endif()
endmacro()
