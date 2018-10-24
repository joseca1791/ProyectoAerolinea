package com.example.pc.aerobarrantes;


import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
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

public class NavDrawerActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_nav_drawer);
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


    private void tipoUsuarioLogueado(){
        SharedPreferences preferences=this.getSharedPreferences(getString(R.string.preference_key_foruser),Context.MODE_PRIVATE);
        String permisos=preferences.getString(getString(R.string.preference_key_foruser),"none");

        NavigationView navigationView=(NavigationView) findViewById(R.id.nav_view);
        Menu menu=navigationView.getMenu();
        MenuItem holder;

        switch (permisos){
            case "admin":
        }

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
        getMenuInflater().inflate(R.menu.nav_drawer, menu);
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
            finish();
            avionesIntent();

        } else if (id == R.id.nav_ciudades) {

        } else if (id == R.id.nav_clientes) {

        } else if (id == R.id.nav_viajes) {

        } else if (id == R.id.nav_vuelos) {

        } else if (id == R.id.nav_logout) {
            Toast.makeText(getApplicationContext(),"Su sesión finalizó correctamente",Toast.LENGTH_LONG).show();
            volverLogin();
        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    public void volverLogin(){
        finish();
        Intent volverLogin=new Intent(this,LoginActivity.class);
        startActivity(volverLogin);
    }

    public void avionesIntent(){
        finish();
        Intent avionesIntent=new Intent(this,AvionesActivity.class);
        startActivity(avionesIntent);
    }

    public void ciudadesIntent(){
        finish();
        Intent ciudadesIntent=new Intent(this,CiudadesActivity.class);
        startActivity(ciudadesIntent);
    }

    public void clientesIntent(){
        finish();
        Intent clientesIntent=new Intent(this,ClientesActivity.class);
        startActivity(clientesIntent);
    }

    public void viajesIntent(){
        finish();
        Intent viajesIntent=new Intent(this,ViajesActivity.class);
        startActivity(viajesIntent);
    }

    public void vuelosIntent(){
        finish();
        Intent vuelosIntent=new Intent(this,VuelosActivity.class);
        startActivity(vuelosIntent);
    }
}
