#pragma once

#include <QObject>
#include <QString>
#include <QtQml/qqmlregistration.h>
#include <memory>
#include "services/ExampleService.h"

class ExampleViewModel : public QObject {
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(QString statusMessage READ statusMessage NOTIFY statusMessageChanged)
    Q_PROPERTY(int itemCount READ itemCount NOTIFY itemCountChanged)

public:
    explicit ExampleViewModel(QObject *parent = nullptr);
    explicit ExampleViewModel(std::shared_ptr<ExampleService> service, QObject *parent = nullptr);
    ~ExampleViewModel() override = default;

    QString title() const;
    void setTitle(const QString &title);

    QString statusMessage() const;
    int itemCount() const;

    Q_INVOKABLE void refresh();
    Q_INVOKABLE void addItem(const QString &title, const QString &description);

signals:
    void titleChanged();
    void statusMessageChanged();
    void itemCountChanged();

private:
    QString m_title{"Scrambly Example"};
    QString m_statusMessage{"Ready"};
    std::shared_ptr<ExampleService> m_service;
};
