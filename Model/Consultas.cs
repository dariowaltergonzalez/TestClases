using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Consultas
    {
     

        public List<usuarios> ConsultarUsuarios()
        {
            using (BoxcoinEntities db = new BoxcoinEntities())
            {
                return db.usuarios.ToList();
            }

        }
       
        public void GuardarUsuario(usuarios Usuario)
        {
            if (Usuario is null)
                return;

            using (BoxcoinEntities db = new BoxcoinEntities())
            {
                
                db.usuarios.Add(Usuario);
                db.SaveChanges();

            }

        }
      
      


    }
}
