package exemple.jdbc;

import java.sql.*;
public class App
{
    public static void main(String[] args)
    {
        try (Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost:3306/mysql",
                "root",
                ""
        ))
        {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select nom, prenom from mabase.client"
            ))
            {
                try (ResultSet rs = ps.executeQuery())
                {
                    while (rs.next())
                    {
                        System.out.printf("%s %s\n", rs.getString(2), rs.getString(1));
                    }
                }
            }

            try (PreparedStatement ps = conn.prepareStatement(
                    "insert into mabase.client (nom, prenom) values (?, ?)"
            ))
            {
                ps.setString(1, "nom");
                ps.setString(2, "prénom");
                ps.executeQuery();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}