package com.model;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Maths implements Serializable{

    private int n;

    public Maths() {
        super();
    }

    public Maths(int n) {
        this.n = n;
    }

    @XmlElement
    public int getN() {
        return this.n;
    }

    @XmlElement
    public int getPow() {
        return (int) Math.pow(n, 2);
    }

    @XmlElement
    public int getsqr() {
        return (int) Math.sqrt(n);
    }

    @XmlElement
    private int getFac() {
        int f = 1;
        for (int i = 2; i <= n; i++) {
            f *= i;
        }
        return f;
    }

}
