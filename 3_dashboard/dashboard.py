import os

import dash
from dash import dcc, html
import dash_bootstrap_components as dbc
import pandas as pd
import plotly.express as px
import psycopg2

from config import DB_CONFIG


def get_view_data(view_name):
    try:
        with psycopg2.connect(**DB_CONFIG) as conn:
            query = f"SELECT * FROM {view_name};"
            return pd.read_sql_query(query, conn)
    except Exception as e:
        print(f"Ошибка при загрузке View {view_name}: {e}")
        return pd.DataFrame()


def build_charts():
    df1 = get_view_data("coaching_staff_by_club")
    df2 = get_view_data("foreign_players_by_nationality")
    df3 = get_view_data("avg_stadium_capacity_by_country")
    df4 = get_view_data("squads_above_average")
    df5 = get_view_data("top_stadium_per_country")

    fig1 = px.bar(
        df1,
        x="club_name",
        y="coaches_count",
        title="Клубы по количеству тренеров",
        labels={"club_name": "Клуб", "coaches_count": "Кол-во тренеров"},
        color="coaches_count",
        color_continuous_scale="Purples",
    )

    fig2 = px.pie(
        df2,
        values="total_legionnaires",
        names="country_name",
        hole=0.4,
        title="Топ-5 стран по количеству легионеров",
    )

    fig3 = px.bar(
        df3,
        x="avg_capacity",
        y="country_name",
        orientation="h",
        title="Средняя вместимость стадионов (Высшая лига)",
        labels={"avg_capacity": "Средняя вместимость", "country_name": "Страна"},
        color="avg_capacity",
        color_continuous_scale="Blues",
    )
    fig3.update_layout(yaxis={"categoryorder": "total ascending"})

    fig4 = px.bar(
        df4,
        x="club_name",
        y="players_count",
        title="Клубы с числом игроков выше среднего",
        labels={"club_name": "Клуб", "players_count": "Кол-во игроков"},
        color="players_count",
        color_continuous_scale="Teal",
    )

    fig5 = px.scatter(
        df5,
        x="country_name",
        y="capacity",
        size="capacity",
        color="club_name",
        hover_name="stadium_name",
        title="Самый большой стадион в каждой стране",
        labels={"country_name": "Страна", "capacity": "Вместимость"},
    )

    return fig1, fig2, fig3, fig4, fig5


app = dash.Dash(__name__, external_stylesheets=[dbc.themes.FLATLY])
fig1, fig2, fig3, fig4, fig5 = build_charts()

app.layout = dbc.Container(
    [
        dbc.Row(
            [
                dbc.Col(
                    html.H1(
                        "Football Data Pipeline Dashboard",
                        className="text-center my-4 text-primary",
                    ),
                    width=12,
                ),
            ]
        ),
        dbc.Row(
            [
                dbc.Col(dbc.Card(dcc.Graph(figure=fig1), body=True), width=6),
                dbc.Col(dbc.Card(dcc.Graph(figure=fig2), body=True), width=6),
            ],
            className="mb-4",
        ),
        dbc.Row(
            [
                dbc.Col(dbc.Card(dcc.Graph(figure=fig3), body=True), width=4),
                dbc.Col(dbc.Card(dcc.Graph(figure=fig4), body=True), width=4),
                dbc.Col(dbc.Card(dcc.Graph(figure=fig5), body=True), width=4),
            ]
        ),
    ],
    fluid=True,
)


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=False, port=8050)