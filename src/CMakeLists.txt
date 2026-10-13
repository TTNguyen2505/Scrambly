qt_add_library(core STATIC)

qt_add_qml_module(core
    URI Scrambly.Core
    VERSION 1.0
    RESOURCE_PREFIX /qt/qml
    SOURCES
        data/models/ExampleModel.h
        data/repositories/ExampleRepository.h
        data/repositories/ExampleRepository.cpp
        services/ExampleService.h
        services/ExampleService.cpp
        viewmodels/ExampleViewModel.h
        viewmodels/ExampleViewModel.cpp
)

target_include_directories(core PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/data/models
    ${CMAKE_CURRENT_SOURCE_DIR}/data/repositories
    ${CMAKE_CURRENT_SOURCE_DIR}/services
    ${CMAKE_CURRENT_SOURCE_DIR}/viewmodels
)

target_link_libraries(core
    PUBLIC
        Qt6::Core
        Qt6::Quick
)

