/*
    Схема БД для информационной системы
    отслеживания выполнения задач.
*/

DROP TABLE IF EXISTS tasks_labels, tasks, labels, users;

-- пользователи системы
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- метки задач
CREATE TABLE IF NOT EXISTS labels (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- задачи
CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    opened BIGINT NOT NULL DEFAULT extract(epoch from now()),
    closed BIGINT DEFAULT 0,
    author_id INTEGER REFERENCES users(id) DEFAULT 0,
    assigned_id INTEGER REFERENCES users(id) DEFAULT 0,
    title TEXT,
    content TEXT
);

-- связь многие-ко-многим
CREATE TABLE IF NOT EXISTS tasks_labels (
    task_id INTEGER REFERENCES tasks(id),
    label_id INTEGER REFERENCES labels(id)
);

-- начальные данные
INSERT INTO users (id, name) VALUES (0, 'default');

-- пример обновления задачи
UPDATE tasks
SET title = 'Updated Title', content = 'Updated Content'
WHERE id = 1;

-- пример удаления задачи
DELETE FROM tasks
WHERE id = 1;
