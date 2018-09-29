package com.example.pc.aerolinebarrantes.AccesoDatos;

import com.example.pc.aerolinebarrantes.LogicaNegocio.Aviones;
import com.example.pc.aerolinebarrantes.LogicaNegocio.Ciudades;
import com.example.pc.aerolinebarrantes.LogicaNegocio.Clientes;
import com.example.pc.aerolinebarrantes.LogicaNegocio.Viajes;
import com.example.pc.aerolinebarrantes.LogicaNegocio.Vuelos;
import java.util.ArrayList;
import java.util.List;

public class ModeloAerolinea {

    private List<Aviones> avionList;
    private List<Ciudades> ciudadList;
    private List<Clientes> clienteList;
    private List<Viajes> viajesList;
    private List<Vuelos> vueloList;

    public ModeloAerolinea(){
        avionList=new ArrayList<>();
        ciudadList=new ArrayList<>();
        clienteList=new ArrayList<>();
        viajesList=new ArrayList<>();
        vueloList=new ArrayList<>();
        prepareAvionesData();
        prepareCiudadesData();
        prepareClientesData();
        prepareViajesData();
        prepareVuelosData();
    }
    public void prepareAvionesData(){

        Aviones avion= new Aviones("Airbus A319","Ribeira Sacra",300);
        avionList.add(avion);

        avion = new Aviones("Airbus A320","Nutria",400);
        avionList.add(avion);

        avion = new Aviones("Airbus A321","Las Medulas",500);
        avionList.add(avion);

        avion = new Aviones("Airbus A322","Ribeira Sacra",600);
        avionList.add(avion);

        avion = new Aviones("Boeing B-747","Cervantes",20);
        avionList.add(avion);

        avion = new Aviones("Airbus A319","Sorolla",800);
        avionList.add(avion);

    }
    public void prepareCiudadesData(){}
    public void prepareClientesData(){}
    public void prepareViajesData(){}
    public void prepareVuelosData(){}

    public List<Aviones> getAvionList() {
        return avionList;
    }
}
