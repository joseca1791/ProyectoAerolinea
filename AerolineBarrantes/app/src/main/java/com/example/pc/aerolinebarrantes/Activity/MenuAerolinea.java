package com.example.pc.aerolinebarrantes.Activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import com.example.pc.aerolinebarrantes.R;

public class MenuAerolinea extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu_aerolinea);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_aerolinea, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_aviones) {
            Toast.makeText(getApplicationContext(), "Mantenimiento Aviones", Toast.LENGTH_SHORT).show();
            abrirMantenimientoAviones();
        }
        else
            if (id == R.id.nav_ciudades) {
                Toast.makeText(getApplicationContext(), "Mantenimiento Ciudades", Toast.LENGTH_SHORT).show();
                abrirMantenimientoCiudades();
        }
        else
            if (id == R.id.nav_clientes) {
                Toast.makeText(getApplicationContext(), "Mantenimiento Clientes", Toast.LENGTH_SHORT).show();
                abrirMantenimientoClientes();
            }

            else
            if (id == R.id.nav_vuelos) {
                Toast.makeText(getApplicationContext(), "Mantenimiento Vuelos", Toast.LENGTH_SHORT).show();
                abrirMantenimientoVuelos();
            }
            else
            if (id == R.id.nav_viajes) {
                Toast.makeText(getApplicationContext(), "Mantenimiento Viajes", Toast.LENGTH_SHORT).show();
                abrirMantenimientoViajes();
            }


        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    public void abrirMantenimientoAviones() {
        Intent intent = new Intent(this, AdmAvionActivity.class);
        startActivity(intent);
    }
        public void abrirMantenimientoCiudades() {
            Intent intent = new Intent(this, AdmCiudadActivity.class);
            startActivity(intent);
        }

    public void abrirMantenimientoClientes() {
        Intent intent = new Intent(this, AdmClienteActivity.class);
        startActivity(intent);
    }

    public void abrirMantenimientoVuelos() {
        Intent intent = new Intent(this, AdmVueloActivity.class);
        startActivity(intent);
    }


    public void abrirMantenimientoViajes() {
        Intent intent = new Intent(this, AdmViajesActivity.class);
        startActivity(intent);
    }



}
