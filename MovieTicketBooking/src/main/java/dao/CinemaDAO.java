package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cinema;

public class CinemaDAO implements ICinemaDAO {

    // Get all cinema
    @Override
    public List<Cinema> getAllCinema() {
        List<Cinema> list = new ArrayList<>();
        // SỬA LỖI: Bỏ dấu ngoặc đơn ()
        String query = "SELECT cinema_id, cinema_name, cinema_address FROM cinemas;";
        try {
            Connection connect = JDBCConnection.getConnection();
            PreparedStatement st = connect.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Cinema(
                    rs.getInt("cinema_id"),
                    rs.getString("cinema_name"),
                    rs.getString("cinema_address")
                ));
            }
            rs.close();
            st.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get cinema by id
    @Override
    public Cinema getCinemaById(int id) {
        Cinema cinema = null;
        // SỬA LỖI: Bỏ dấu ngoặc đơn ()
        String query = "SELECT cinema_id, cinema_name, cinema_address FROM cinemas WHERE cinema_id = ?;";
        try {
            Connection connect = JDBCConnection.getConnection();
            PreparedStatement st = connect.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cinema = new Cinema(
                    rs.getInt("cinema_id"),
                    rs.getString("cinema_name"),
                    rs.getString("cinema_address")
                );
            }
            rs.close();
            st.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cinema;
    }
    
    // Add cinema
    @Override
    public void addCinema(Cinema cinema) {
        try {
            String query = "INSERT INTO cinemas (cinema_name, cinema_address) VALUES (?, ?);";
            Connection connect = JDBCConnection.getConnection();
            PreparedStatement st = connect.prepareStatement(query);
            st.setString(1, cinema.getName());
            st.setString(2, cinema.getAddress());
            st.executeUpdate();
            st.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete cinema by id
    @Override
    public void deleteCinemaById(int id) {
        try {
            String query = "DELETE FROM cinemas WHERE cinema_id = ?;";
            Connection connect = JDBCConnection.getConnection();
            PreparedStatement st = connect.prepareStatement(query);
            st.setInt(1, id);
            st.executeUpdate();
            st.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}