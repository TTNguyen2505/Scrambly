cmake_minimum_required(VERSION 3.16)

project(Scrambly VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

set(QT_QML_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/qml")

qt_add_executable(appScrambly
    main.cpp
)

add_subdirectory(qml)

set_target_properties(appScrambly PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appScrambly
    PRIVATE
        Scramblyplugin
        Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appScrambly
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
