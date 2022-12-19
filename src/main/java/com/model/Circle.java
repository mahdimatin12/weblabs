package com.model;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Circle implements Serializable {

    private double radius;

    public Circle() {
        super();
    }

    public Circle(double radius) {
        this.radius = radius;
    }

    @XmlElement
    public double getPerimeter() {
        return 2 * radius * Math.PI;
    }

    @XmlElement
    public double getArea() {
        return Math.pow(radius, 2) * Math.PI;
    }

}
