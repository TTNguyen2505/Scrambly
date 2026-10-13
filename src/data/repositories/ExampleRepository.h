#pragma once

#include <QList>
#include <optional>
#include "data/models/ExampleModel.h"

class ExampleRepository {
public:
    ExampleRepository();
    virtual ~ExampleRepository() = default;

    virtual QList<ExampleModel> getAll() const;
    virtual std::optional<ExampleModel> getById(int id) const;
    virtual void add(const ExampleModel &item);

private:
    QList<ExampleModel> m_items;
};
