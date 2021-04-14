package com.emergentes.modelo;
import java.util.ArrayList;
import java.util.Iterator;
/**
 *
 * @author Nek0
 */
public class GestorDatos 
{
    private ArrayList<Dato>lista;
    public GestorDatos()
    {
        lista=new ArrayList <Dato>();
    }
    public ArrayList<Dato> getLista() 
    {
        return lista;
    }
    public void setLista(ArrayList<Dato> lista) 
    {
        this.lista = lista;
    }
    public void insertarDato(Dato item)
    {
        lista.add(item);
    }
    public void modificarDato(int pos, Dato item)
    {
        lista.set(pos,item);
    }
    public void eliminarDato(int pos)
    {
        lista.remove(pos);
    }
    public int obtieneId()
    {
        int idaux =0;
        for(Dato item:lista)
        {
            idaux=item.getId();
        }
        return idaux+1;
    }
    public int ubicarDato(int id)
    {
        int pos =-1;
        Iterator<Dato> it = lista.iterator();
        while(it.hasNext())
        {
            ++pos;
            Dato aux =it.next();
            if(aux.getId()==id)
            {
                break;
            }
        }
        return pos;
    }
}