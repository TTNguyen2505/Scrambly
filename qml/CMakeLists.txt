add_subdirectory(design_system)

qt_add_library(Scrambly STATIC)

qt_add_qml_module(Scrambly
    URI Scrambly
    VERSION 1.0
    RESOURCE_PREFIX /qt/qml
    QML_FILES
        Main.qml
        views/ExampleView.qml
)

target_link_libraries(Scrambly
    PRIVATE
        design_system
        Qt6::Quick
)
