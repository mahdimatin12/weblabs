package com.model.dao;

import com.model.Admins;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author George
 */
public class AdminDAO {
    private Admins admins;
    private String fileName;
    
    public AdminDAO(){  }
    
    public void setFileName(String fileName) throws JAXBException, FileNotFoundException{
        this.fileName = fileName;
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(fileName);
        admins = (Admins) um.unmarshal(fin);
    }
    
    public Admins read(String filename) throws JAXBException, FileNotFoundException{
        this.fileName = filename;
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filename);
        admins = (Admins) um.unmarshal(fin);
        return admins;
    }

    public Admins getAdmins() {
        return admins;
    }
}
