qt_add_library(design_system STATIC)

qt_add_qml_module(design_system
    URI Scrambly.DesignSystem
    VERSION 1.0
    RESOURCE_PREFIX /qt/qml
    QML_FILES
        ExamplePrimitiveTokens.qml
        ExampleSemanticTokens.qml
        components/ExmapleComponent.qml
)

target_link_libraries(design_system
    PRIVATE
        Qt6::Quick
)

