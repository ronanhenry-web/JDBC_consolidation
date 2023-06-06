package exemple.jdbc;

import java.sql.*;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.mariadb.jdbc.Driver");

        try {
            Connection cnx = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mysql",
                    "root", "");

            // Requete 1
            PreparedStatement ps = cnx.prepareStatement("select count(0) from mabase.commande");
            ResultSet rs = ps.executeQuery();
            boolean trouve = rs.next();
            if (trouve) {
                int nb = rs.getInt(1);
                System.out.println(nb);
            }

            // Requete 2
            ps =  cnx.prepareStatement("select date_commande, nom_client, prenom_client from mabase.commande where nom_client like ?");
            ps.setString(1, "%" + "henry" + "%");
            rs = ps.executeQuery();
            while(rs.next()) {
                Date date = rs.getDate(1);
                String nom = rs.getString(2);
                String prenom = rs.getString(3);
                System.out.println(date + " " + nom + " " + prenom);
            }

        } catch (Exception exception) {
            System.out.println("Erreur survenue");
            exception.printStackTrace();
        }
    }
}