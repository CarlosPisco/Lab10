package Beans;

public class Contratos {
    private String nroDeContrato;
    private String idCliente;
    private String divisa;
    private String estado;
    private int mesesEnEstado;


    public String getNroDeContrato() {
        return nroDeContrato;
    }

    public void setNroDeContrato(String nroDeContrato) {
        this.nroDeContrato = nroDeContrato;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public String getDivisa() {
        return divisa;
    }

    public void setDivisa(String divisa) {
        this.divisa = divisa;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getMesesEnEstado() {
        return mesesEnEstado;
    }

    public void setMesesEnEstado(int mesesEnEstado) {
        this.mesesEnEstado = mesesEnEstado;
    }
}
