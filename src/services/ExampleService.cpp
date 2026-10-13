#include "services/ExampleService.h"

ExampleService::ExampleService()
    : m_repository(std::make_shared<ExampleRepository>()) {}

ExampleService::ExampleService(std::shared_ptr<ExampleRepository> repository)
    : m_repository(std::move(repository)) {}

QList<ExampleModel> ExampleService::getItems() const {
    return m_repository ? m_repository->getAll() : QList<ExampleModel>{};
}

int ExampleService::getItemCount() const {
    return static_cast<int>(getItems().size());
}

QString ExampleService::getSummary() const {
    return QString("Total items: %1").arg(getItemCount());
}

void ExampleService::createItem(const QString &title, const QString &description) {
    if (!m_repository) {
        return;
    }
    const int newId = getItemCount() + 1;
    m_repository->add(ExampleModel{newId, title, description});
}

