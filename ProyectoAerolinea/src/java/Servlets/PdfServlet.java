package Servlets;

import Model.Avion;
import Model.Ciudad;
import Model.Cliente;
import Model.Jsonable;
import Model.Reservacion;
import Model.Tiquete;
import Model.Viaje;
import Model.Vuelo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.google.gson.typeadapters.RuntimeTypeAdapterFactory;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.OutputStream;
import com.itextpdf.text.Element;
import java.io.ByteArrayOutputStream;
import java.lang.reflect.Type;
import java.util.List;
import javax.servlet.annotation.WebServlet;



/**
 *
 * @author Greivin Es un Servlet
 */
@WebServlet(name = "PdfServlet", urlPatterns = {"/PdfServlet"})
public class PdfServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


          
        try{
        
        List<Tiquete> tiquetes = (List<Tiquete>) request.getSession().getAttribute("tiquetes");
        
        Paragraph p;
        Document document = new Document();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, baos);
        document.open();
 
        for(int i = 0; i<tiquetes.size(); i++){

        p = new Paragraph(String.format(("TIQUETE DE VUELO #"+tiquetes.get(i).getNumero_tiquete()+"")));
            
        p.setAlignment(Element.ALIGN_CENTER);
       System.out.println(p);
        document.add(p);

        p = new Paragraph(String.format(("Vuelo "+tiquetes.get(i).getReservacion().getViaje().getVuelo().getCodigo()+", "+
                tiquetes.get(i).getReservacion().getViaje().getVuelo().getOrigen().getNombre()+" - "+
                tiquetes.get(i).getReservacion().getViaje().getVuelo().getDestino().getNombre()+", "+
                tiquetes.get(i).getReservacion().getViaje().getFecha())));

        p.setAlignment(Element.ALIGN_LEFT);
        System.out.println(p);
        document.add(p);
        
       // Image img = new Image(ImageDataFactory.create(this.getServletContext().getResource("/images/Reporte.png")));
        //document.add(img);
        
        p = new Paragraph(String.format((tiquetes.get(i).getNombre_dueno()+" "+tiquetes.get(i).getApellido_dueno()+
        "  Asiento: "+tiquetes.get(i).getAsiento())));
        System.out.println(p);
        document.add(p);

        p = new Paragraph(String.format(("COSTO DEL TIQUETE: "+tiquetes.get(i).getReservacion().getViaje().getVuelo().getPrecio())));
        p.setAlignment(Element.ALIGN_RIGHT);
        System.out.println(p);
        document.add(p);
        
        p = new Paragraph(String.format(("Reservacion #"+tiquetes.get(i).getReservacion().getNumero_reservacion()+
                " A nombre de: "+tiquetes.get(i).getReservacion().getCliente().getNombre()+" "+
                tiquetes.get(i).getReservacion().getCliente().getApellidos())));
        p.setAlignment(Element.ALIGN_RIGHT);
        System.out.println(p);
        document.add(p);
        
        p = new Paragraph(String.format(("\n\n--------------------------------------------\n\n")));
        document.add(p);
        
        }//del for
        document.close();
         response.setHeader("Expires", "0");
            response.setHeader("Cache-Control",
                "must-revalidate, post-check=0, pre-check=0");
            response.setHeader("Pragma", "public");
            response.setContentType("application/pdf");
             response.setContentLength(baos.size());
             OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();
        }catch(DocumentException e){
             throw new IOException(e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}