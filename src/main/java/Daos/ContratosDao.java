package Daos;

import Beans.Contratos;
import DTOs.CantidadContratos;
import DTOs.ExpectedLoss;

import javax.xml.transform.Result;
import java.sql.*;

import java.util.ArrayList;

public class ContratosDao extends BaseDao{

    public ArrayList<Contratos> listarContratos (String nroDocumento){

        ArrayList<Contratos> listaContratos = new ArrayList<>();

        String sql = "select * from jm_cotr_bis where client_nro_id = ?";
        try(Connection connection = getConnection();
            PreparedStatement pstm = connection.prepareStatement(sql)) {

            pstm.setString(1,nroDocumento);

            try (ResultSet rs = pstm.executeQuery()){
                if(rs.next()){

                    Contratos contrato = new Contratos();
                    contrato.setNroDeContrato(rs.getString(1));
                    contrato.setIdCliente(rs.getString(2));
                    contrato.setDivisa(rs.getString(3));
                    switch(rs.getInt(4)){
                        case 0 :

                            contrato.setEstado("Normal");
                            break;

                        case 1 :

                            contrato.setEstado("Cura");
                            break;

                        case 2 :

                            contrato.setEstado("Mora");
                            break;



                    }

                    contrato.setMesesEnEstado(rs.getInt(5));
                    listaContratos.add(contrato);

                }


            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaContratos;
    }


    //muestra la cantidad de contratos por estado de un cliente
    public ArrayList<CantidadContratos> mostarCantidadContratos (String nroDocumento){

        ArrayList<CantidadContratos> listaCantidadContratosEstado = new ArrayList<>();
        String sql = "select count(*),G6789_status\n" +
                "from jm_cotr_bis \n" +
                "where client_nro_id = ?\n" +
                "group by G6789_status";

        try(Connection connection = getConnection();
            PreparedStatement pstm = connection.prepareStatement(sql)) {

            pstm.setString(1,nroDocumento);

            try(ResultSet rs = pstm.executeQuery()){

                if(rs.next()){
                    CantidadContratos cc = new CantidadContratos();

                    cc.setCantidad(rs.getInt(1));
                    switch(rs.getInt(2)){
                        case 0 :

                            cc.setStatus("NORMAL");
                            break;

                        case 1 :

                            cc.setStatus("CURA");
                            break;

                        case 2 :

                            cc.setStatus("MORA");
                            break;

                    }
                    listaCantidadContratosEstado.add(cc);
                }


            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaCantidadContratosEstado;
    }


    public ArrayList<ExpectedLoss> mostrarMaxExpectedLoss (String idCliente){
        ArrayList<ExpectedLoss> listLossContracts = new ArrayList<>();

        String sql = "select pd_value*lgd_value*(1-recovery_Rate) as `loss`, va.jm_cotr_bis_g6789_cod_nup as `con`\n" +
                "from jm_values va\n" +
                "inner join jm_cotr_bis ct on ct.g6789_contract = va.jm_cotr_bis_g6789_cod_nup\n" +
                "inner join jm_client_bii cl on cl.g4093_nro_id = ct.client_nro_id\n" +
                "where cl.g4093_nro_id = ?";

        try(Connection connection = getConnection();
            PreparedStatement pstm = connection.prepareStatement(sql)) {

            pstm.setString(1,idCliente);

            try (ResultSet rs = pstm.executeQuery()){
                if(rs.next()){
                    ExpectedLoss  el = new ExpectedLoss();

                    el.setLoss(rs.getDouble(1));
                    el.setNroContrato(rs.getString(2));
                    listLossContracts.add(el);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listLossContracts;

    }




}
