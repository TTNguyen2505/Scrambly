#include "data/repositories/ExampleRepository.h"

ExampleRepository::ExampleRepository() {
    m_items = {{1, "Item One", "Description for item one"},
               {2, "Item Two", "Description for item two"},
               {3, "Item Three", "Description for item three"}};
}

QList<ExampleModel> ExampleRepository::getAll() const { return m_items; }

std::optional<ExampleModel> ExampleRepository::getById(int id) const {
    for (const auto &item: m_items) {
        if (item.id == id) {
            return item;
        }
    }
    return std::nullopt;
}

void ExampleRepository::add(const ExampleModel &item) { m_items.append(item); }
