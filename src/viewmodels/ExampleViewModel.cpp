#include "viewmodels/ExampleViewModel.h"

ExampleViewModel::ExampleViewModel(QObject *parent) : ExampleViewModel(std::make_shared<ExampleService>(), parent) {}

ExampleViewModel::ExampleViewModel(std::shared_ptr<ExampleService> service, QObject *parent) :
    QObject(parent), m_service(std::move(service)) {
    refresh();
}

QString ExampleViewModel::title() const { return m_title; }

void ExampleViewModel::setTitle(const QString &title) {
    if (m_title != title) {
        m_title = title;
        emit titleChanged();
    }
}

QString ExampleViewModel::statusMessage() const { return m_statusMessage; }

int ExampleViewModel::itemCount() const { return m_service ? m_service->getItemCount() : 0; }

void ExampleViewModel::refresh() {
    if (m_service) {
        m_statusMessage = m_service->getSummary();
    } else {
        m_statusMessage = "Service unavailable";
    }
    emit statusMessageChanged();
    emit itemCountChanged();
}

void ExampleViewModel::addItem(const QString &title, const QString &description) {
    if (m_service) {
        m_service->createItem(title, description);
        m_statusMessage = QString("Added '%1'").arg(title);
        emit statusMessageChanged();
        emit itemCountChanged();
    }
}
