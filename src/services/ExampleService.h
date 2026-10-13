#pragma once

#include <QList>
#include <QString>
#include <memory>
#include "data/models/ExampleModel.h"
#include "data/repositories/ExampleRepository.h"

class ExampleService {
public:
    ExampleService();
    explicit ExampleService(std::shared_ptr<ExampleRepository> repository);
    virtual ~ExampleService() = default;

    QList<ExampleModel> getItems() const;
    int getItemCount() const;
    QString getSummary() const;
    void createItem(const QString &title, const QString &description);

private:
    std::shared_ptr<ExampleRepository> m_repository;
};
