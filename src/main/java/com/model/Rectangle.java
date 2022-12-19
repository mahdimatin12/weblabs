package com.model;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Rectangle implements Serializable{

    private double height;
    private double width;

    public Rectangle() {
        super();
    }

    public Rectangle(double height, double width) {
        this.height = height;
        this.width = width;
    }

    @XmlElement
    public double getPrimeter() {
        return 2 * (height + width);
    }

    @XmlElement
    public double getArea() {
        return height * width;
    }

}
