add_subdirectory(design_system)

qt_add_qml_module(appScrambly
    URI Scrambly
    VERSION 1.0
    RESOURCE_PREFIX /qt/qml
    QML_FILES
        Main.qml
        views/ExampleView.qml
)

target_link_libraries(appScrambly
    PRIVATE
        design_system
)

