///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package DAO;
//
//import ENTITIES.Route;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//
///**
// *
// * @author felipebrizola
// */
//public class RouteDao {
//    
//    public ArrayList<Route> getRoutes(String from, String to) throws DaoException {
//        ArrayList<Route> routeList = new ArrayList<>();
//        String sql = "SELECT * FROM ROUTES WHERE FROM = ? AND TO = ?";
//        Connection connection = dbFactory.getConnection();
//            try (PreparedStatement command = connection.prepareStatement(sql)) {
//                command.setString(1, from);
//                command.setString(2, to);
//                try (ResultSet result = command.executeQuery()) {
//                    if (result.next()) {
//                        String rFrom = result.getString("FROM");
//                        String rTo = result.getString("TO");
//                        String uEquipment = result.getString("EQUIPMENT");
//                        
//                        routeList.add(new Route(rFrom, rTo,uEquipment));
//                    }
//                }
//           
//
//        } catch (Exception ex) {
//            throw new DaoException("Falha ao buscar rotas. ");
//        }
//        if(routeList.isEmpty())
//            throw new DaoException("Nao foram encontradas rotas disponiveis");
//        
//        return routeList;
//                   
//    } 
//    
//}
