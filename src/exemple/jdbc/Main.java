package exemple.jdbc;

import java.sql.*;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.mariadb.jdbc.Driver");

        test1();

        Connection cnx = null;
        try {
            cnx = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mysql",
                    "root", "");

            //cnx.setAutoCommit(false);

            // Requete 1
            PreparedStatement ps = cnx.prepareStatement("select count(0) from mabase.commande");
            ResultSet rs = ps.executeQuery();
            boolean trouve = rs.next();
            if (trouve) {
                int nb = rs.getInt(1);
                System.out.println(nb);
            }

            // Requete 2
            ps = cnx.prepareStatement("select date_commande, nom_client, prenom_client from mabase.commande where nom_client like ?");
            ps.setString(1, "%" + "henry" + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Date date = rs.getDate(1);
                String nom = rs.getString(2);
                String prenom = rs.getString(3);
                System.out.println(date + " " + nom + " " + prenom);
            }

            //cnx.commit();

        } catch (Exception exception) {
            System.err.println("Erreur survenue");
            exception.printStackTrace();

            //cnx.rollback();

        } finally {
            if (null != cnx) {
                try {
                    cnx.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }

    public static void test1() throws SQLException, ClassNotFoundException {
        Class.forName("org.mariadb.jdbc.Driver");

        try (Connection cnx = DriverManager.getConnection(
                "jdbc:mariadb://localhost:3306/mysql",
                "root", "")) {

            try (var ps = cnx.prepareStatement("update mabase.client set prenom =  concat(prenom, '.')")) {
                int nb = ps.executeUpdate();
                System.out.println("Nombre de clients maj: " + nb);
            }
        }
    }
}
