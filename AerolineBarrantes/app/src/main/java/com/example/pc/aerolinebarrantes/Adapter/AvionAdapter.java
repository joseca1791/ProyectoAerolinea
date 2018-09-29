package com.example.pc.aerolinebarrantes.Adapter;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.example.pc.aerolinebarrantes.LogicaNegocio.Aviones;
import com.example.pc.aerolinebarrantes.R;

import java.util.ArrayList;
import java.util.List;

public class AvionAdapter extends RecyclerView.Adapter<AvionAdapter.MyViewHolder> implements Filterable{

    private List<Aviones> avionesList;
    private AvionAdapterListener avionAdapterListener;
    private List<Aviones> avionesListFiltered;

    public class MyViewHolder extends RecyclerView.ViewHolder{
        public TextView titulo1,titulo2,description;
        public RelativeLayout viewForeground,viewBackgroundDelete,viewBackgroundEdit;

        public MyViewHolder(View view) {
            super(view);
            titulo1 = view.findViewById(R.id.titleFirstLbl);
            titulo2 = view.findViewById(R.id.titleSecLbl);
            description = view.findViewById(R.id.descriptionLbl);
            viewBackgroundDelete = view.findViewById(R.id.view_background_delete);
            viewBackgroundEdit = view.findViewById(R.id.view_background_edit);
            viewForeground = view.findViewById(R.id.view_foreground);
            view.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    // send selected contact in callback
                    avionAdapterListener.onContactSelected(avionesListFiltered.get(getAdapterPosition()));
                }
            });
        }
    }

    public AvionAdapter(List<Aviones> avionesList, AvionAdapterListener avionAdapterListener) {
        this.avionesList = avionesList;
        this.avionAdapterListener = avionAdapterListener;
        this.avionesListFiltered = avionesList;
    }

    @Override
    public AvionAdapter.MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_list_row, parent, false);

        return new MyViewHolder(itemView);
    }


    @Override
    public int getItemCount() {
        return avionesListFiltered.size();
    }
    public void onBindViewHolder(AvionAdapter.MyViewHolder holder, int position) {
        // rendering view
        final Aviones avion= avionesListFiltered.get(position);
        holder.titulo1.setText(avion.getCodigo_Avion());
        holder.titulo2.setText(avion.getModelo());
        holder.description.setText(avion.getCapacidad());
    }

    public AvionAdapter() {
        super();
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position, @NonNull List<Object> payloads) {
        super.onBindViewHolder(holder, position, payloads);
    }

    @Override
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }

    @Override
    public void setHasStableIds(boolean hasStableIds) {
        super.setHasStableIds(hasStableIds);
    }

    @Override
    public long getItemId(int position) {
        return super.getItemId(position);
    }

    @Override
    public void onViewRecycled(@NonNull MyViewHolder holder) {
        super.onViewRecycled(holder);
    }

    @Override
    public boolean onFailedToRecycleView(@NonNull MyViewHolder holder) {
        return super.onFailedToRecycleView(holder);
    }

    @Override
    public void onViewAttachedToWindow(@NonNull MyViewHolder holder) {
        super.onViewAttachedToWindow(holder);
    }

    @Override
    public void onViewDetachedFromWindow(@NonNull MyViewHolder holder) {
        super.onViewDetachedFromWindow(holder);
    }

    @Override
    public void registerAdapterDataObserver(@NonNull RecyclerView.AdapterDataObserver observer) {
        super.registerAdapterDataObserver(observer);
    }

    @Override
    public void unregisterAdapterDataObserver(@NonNull RecyclerView.AdapterDataObserver observer) {
        super.unregisterAdapterDataObserver(observer);
    }

    @Override
    public void onAttachedToRecyclerView(@NonNull RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
    }

    @Override
    public void onDetachedFromRecyclerView(@NonNull RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    @Override
    public String toString() {
        return super.toString();
    }

    @Override
    protected void finalize() throws Throwable {
        super.finalize();
    }

    @Override
    public Filter getFilter() {
        return new Filter() {
            @Override
            protected FilterResults performFiltering(CharSequence charSequence) {
                String charString = charSequence.toString();
                if (charString.isEmpty()) {
                    avionesListFiltered = avionesList;
                } else {
                    List<Aviones> filteredList = new ArrayList<>();
                    for (Aviones row : avionesList) {
                        // filter use two parameters
                        if (row.getCodigo_Avion().toLowerCase().contains(charString.toLowerCase()) || row.getModelo().toLowerCase().contains(charString.toLowerCase())) {
                            filteredList.add(row);
                        }
                    }

                    avionesListFiltered = filteredList;
                }

                FilterResults filterResults = new FilterResults();
                filterResults.values = avionesListFiltered;
                return filterResults;
            }

            @Override
            protected void publishResults(CharSequence charSequence, FilterResults filterResults) {
                avionesListFiltered = (ArrayList<Aviones>) filterResults.values;
                notifyDataSetChanged();
            }
        };
    }

    public interface AvionAdapterListener {
        void onContactSelected(Aviones avion);
    }
}
