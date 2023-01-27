package org.example;

import java.sql.*;

public class Main {
    public static void main(String[] args) {
        final String URL = "jdbc:postgresql://localhost:5432/it.academy";
        final String USER_NAME = "postgres";
        final String PASSWORD = "hr";

        Connection connection = null;

        try {
            connection = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
            Statement statement = connection.createStatement();
            String SQL = "select * from orders order by id";
            ResultSet resultSet = statement.executeQuery(SQL);
            System.out.println("Все заказы полученные кафе:");
            while (resultSet.next()) {
                System.out.println(resultSet.getInt("id") + " - " +
                        resultSet.getInt("cafe_id") + " - " +
                        resultSet.getInt("client_id") + " - " +
                        resultSet.getInt("dish_id") + " - " +
                        resultSet.getString("order_time"));
            }

            SQL = "select name, count(*) from dishes\n" +
                    "join orders on(dishes.id = orders.dish_id)\n" +
                    "group by orders.dish_id, name order by count(*) desc\n" +
                    "limit 3";
            resultSet = statement.executeQuery(SQL);
            System.out.println("\nТоп 3 популярных блюда:");
            while (resultSet.next()) {
                System.out.println(resultSet.getString("name") + " - " + resultSet.getInt("count"));
            }

            SQL = "select * from dishes order by price";
            resultSet = statement.executeQuery(SQL);
            System.out.println("\nСортировка по ценам блюд:");
            while (resultSet.next()) {
                System.out.println(resultSet.getInt("id") + " - " +
                        resultSet.getString("name") + " - " +
                        resultSet.getDouble("price"));
            }

            SQL = "select * from dishes where id not in( select dish_id from orders group by dish_id )";
            resultSet = statement.executeQuery(SQL);
            System.out.println("\nБлюда которые никогда не заказывались:");
            while (resultSet.next()) {
                System.out.println(resultSet.getInt("id") + " - " +
                        resultSet.getString("name") + " - " +
                        resultSet.getDouble("price"));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}