add_subdirectory(design_system)

qt_add_library(Scrambly STATIC)

set_source_files_properties(values/Strings.qml PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(Scrambly
    URI Scrambly
    VERSION 1.0
    RESOURCE_PREFIX /qt/qml
    QML_FILES
        Main.qml
        views/ExampleView.qml
        values/Strings.qml
)

target_link_libraries(Scrambly
    PRIVATE
        core
        design_system
        Qt6::Quick
)
