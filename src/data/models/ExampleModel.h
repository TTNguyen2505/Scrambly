#pragma once

#include <QObject>
#include <QString>

struct ExampleModel {
    Q_GADGET
    Q_PROPERTY(int id MEMBER id)
    Q_PROPERTY(QString title MEMBER title)
    Q_PROPERTY(QString description MEMBER description)

public:
    int id{0};
    QString title{};
    QString description{};

    ExampleModel() = default;
    ExampleModel(int id, QString title, QString description) :
        id(id), title(std::move(title)), description(std::move(description)) {}

    bool operator==(const ExampleModel &other) const {
        return id == other.id && title == other.title && description == other.description;
    }
};
