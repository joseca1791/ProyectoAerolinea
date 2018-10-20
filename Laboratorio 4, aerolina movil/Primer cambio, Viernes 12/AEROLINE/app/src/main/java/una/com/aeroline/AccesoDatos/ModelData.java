package una.com.aeroline.AccesoDatos;

import java.util.ArrayList;
import java.util.List;

import una.com.aeroline.LogicaNegocio.Usuario;

/**
 * Created by User on 26/03/2018.
 */

public class ModelData {


    public ModelData() {

    }


    public List<Usuario> getUsuariosList() {
        List<Usuario> users = new ArrayList<>();
        users.add(new Usuario("Kjesus96@gmail.com", "1896", "administrador", "1896","Keylor","Cruz Carvajal","22650798","1996-04-18"));
        /*users.add(new Usuario("@admin2", "admin", "administrador", "222"));
        users.add(new Usuario("@matric", "matric", "matriculador", "333"));
        users.add(new Usuario("@matric1", "matric", "matriculador", "444"));
        users.add(new Usuario("@matric2", "matric", "matriculador", "555"));
        users.add(new Usuario("@matric3", "matric", "matriculador", "555"));*/
        return users;
    }
}
