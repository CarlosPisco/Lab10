package Daos;

import Beans.Clientes;
import Beans.Credentials;

import java.sql.*;
import java.util.ArrayList;

public class UsuarioDao extends BaseDao{

    public Credentials buscarUsuario (String numeroDocumento, String password){

        Credentials credentials = null;

        String sql = "select *  from credentials where nro_documento = ? and sha2(?,256)=hashedPassword";

        try(Connection connection = getConnection();
            PreparedStatement pstm = connection.prepareStatement(sql)) {

            pstm.setString(1,numeroDocumento);
            pstm.setString(2,password);

            try(ResultSet rs = pstm.executeQuery()){

                if(rs.next()){
                    credentials = new Credentials();
                    credentials.setNumeroDocumento(rs.getString(1));
                    credentials.setTipoUsuario(rs.getInt(4));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return credentials;



    }


    public void createCredentialCliente (String nroDocumento, String password){

        String sql = "insert into credentials (nro_documento,password, hashedPassword,tipoUsuario) values (?,?,sha2(?,256),?)";

        try(Connection connection = getConnection();
            PreparedStatement pstm = connection.prepareStatement(sql)) {

            pstm.setString(1,nroDocumento);
            pstm.setString(2,password);
            pstm.setString(3,password);
            pstm.setInt(4,2);

            pstm.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public Clientes buscarCliente (String idCliente){
        Clientes cliente = new Clientes();
        String sql = "SELECT * FROM jm_client_bii";

        try(Connection connection = getConnection();
            Statement stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(sql)) {

            if(rs.next()){

                cliente.setNombreCliente(rs.getString(2));
                cliente.setEdad(rs.getString(rs.getString(3)));
                switch(rs.getString(4)){
                    case "N":
                        cliente.setTipoCliente("NATURAL");
                        break;
                    case "J":
                        cliente.setTipoCliente("JURIDICA");
                        break;
                }
                cliente.setTipoDocumento(rs.getString(5));
                cliente.setNumeroDocumento(rs.getString(1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cliente;
    }


    public ArrayList<Clientes> listarClientes (){

        String sql = "select * from jm_client_bii\n" +
                "where g4093_nro_id not in (select nro_documento from credentials)";

        ArrayList<Clientes> listaClientes = new ArrayList<>();

        try(Connection connection = getConnection();
            Statement stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(sql)) {

            while(rs.next()){
                Clientes cliente = new Clientes();
                cliente.setNombreCliente(rs.getString(2));
                cliente.setEdad(rs.getString(3));
                switch(rs.getString(4)){
                    case "N":
                        cliente.setTipoCliente("NATURAL");
                        break;
                    case "J":
                        cliente.setTipoCliente("JURIDICA");
                        break;
                }
                cliente.setTipoDocumento(rs.getString(5));
                cliente.setNumeroDocumento(rs.getString(1));
                listaClientes.add(cliente);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaClientes;
    }


}
