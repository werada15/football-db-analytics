# Football DB

Проект представляет собой базу данных для футбольных клубов, аналитические представления и dashboard на Dash/Plotly.

## Состав проекта
- `1_database/` — схема таблиц и начальные данные PostgreSQL
- `2_analytics/` — SQL-views для аналитики
- `3_dashboard/` — приложение Dash для визуализации
- `Dockerfile` — контейнер для dashboard
- `docker_compose.yml` — стек из PostgreSQL + dashboard

## Требования
- Docker
- Docker Compose

## Запуск
docker compose -f docker_compose.yml up --build

После старта:
- PostgreSQL: http://localhost:5432
- Dashboard: http://localhost:8050

## Переменные окружения
Доступны значения по умолчанию в `3_dashboard/config.py`.

## Важные замечания
- Для работы внутри контейнера приложение подключается к сервису `db` по имени хоста, а не `localhost`.
- При первом запуске Compose передаёт PostgreSQL SQL-файлы в порядке:
  1. `1_database/00_tables_create.sql` — создание таблиц
  2. `1_database/01_data_insert.sql` — начальные данные
  3. `2_analytics/analytic_views.sql` — аналитические представления
- SQL-скрипты выполняются автоматически только при первом создании каталога данных PostgreSQL.
  Чтобы повторно инициализировать БД с нуля, используйте `docker compose -f docker_compose.yml down -v`,
  затем снова `docker compose -f docker_compose.yml up --build`.
