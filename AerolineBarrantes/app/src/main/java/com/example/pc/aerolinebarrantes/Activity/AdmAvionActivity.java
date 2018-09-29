package com.example.pc.aerolinebarrantes.Activity;

import android.app.SearchManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SearchView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.View;
import android.widget.Toast;

import com.example.pc.aerolinebarrantes.AccesoDatos.ModeloAerolinea;
import com.example.pc.aerolinebarrantes.Adapter.AvionAdapter;
import com.example.pc.aerolinebarrantes.LogicaNegocio.Aviones;
import com.example.pc.aerolinebarrantes.R;

import java.util.ArrayList;
import java.util.List;

public class AdmAvionActivity extends AppCompatActivity implements AvionAdapter.AvionAdapterListener{

    private ModeloAerolinea model;
    private List<Aviones> avionList;
    private RecyclerView mRecyclerView;
    private AvionAdapter mAdapter;
    private CoordinatorLayout coordinatorLayout;
    private SearchView searchView;


    @Override
    public void onContactSelected(Aviones avion) {
        SharedPreferences prefs = this.getSharedPreferences(getString(R.string.preference_user_key), Context.MODE_PRIVATE);
        String defaultValue = getResources().getString(R.string.preference_user_key_default);
        Toast.makeText(getApplicationContext(), "Selected: " + avion.getCodigo_Avion() + ", " + avion.getModelo(), Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_adm_avion);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbarA);
        setSupportActionBar(toolbar);

        getSupportActionBar().setTitle("Aviones");

       // mRecyclerView=findViewById(R.id.recycler_avionFld);

        avionList=new ArrayList<>();
        model=new ModeloAerolinea();
        avionList=model.getAvionList();
        mAdapter=new AvionAdapter(avionList, this);
        coordinatorLayout=findViewById(R.id.coordinator_layoutA);



        RecyclerView.LayoutManager mLayoutManager= new LinearLayoutManager(getApplicationContext());
        mRecyclerView.setLayoutManager(mLayoutManager);
        mRecyclerView.setItemAnimator(new DefaultItemAnimator());
        mRecyclerView.addItemDecoration(new DividerItemDecoration(this,DividerItemDecoration.VERTICAL));
        mRecyclerView.setAdapter(mAdapter);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.addBtnA);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });

        mAdapter.notifyDataSetChanged();
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds alumnoList to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_search, menu);

        // Associate searchable configuration with the SearchView   !IMPORTANT
        SearchManager searchManager = (SearchManager) getSystemService(Context.SEARCH_SERVICE);
        searchView = (SearchView) menu.findItem(R.id.action_search)
                .getActionView();
        searchView.setSearchableInfo(searchManager
                .getSearchableInfo(getComponentName()));
        searchView.setMaxWidth(Integer.MAX_VALUE);

        // listening to search query text change, every type on input
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                // filter recycler view when query submitted
                mAdapter.getFilter().filter(query);
                return false;
            }

            @Override
            public boolean onQueryTextChange(String query) {
                // filter recycler view when text is changed
                mAdapter.getFilter().filter(query);
                return false;
            }
        });
        return true;
    }
}
