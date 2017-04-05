/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Road;

import Business.Supplier.Products.Product;
import Business.Supplier.Supplier;
import Business.UserAccount.UserAccount;

/**
 *
 * @author Leandra
 */
public class Road {

    private int roadid;
    private String roadName;
    private String roadLocation;
    private int roadPrice;
    private static int count = 1;
    private int noOfSensors;
    private Supplier roadSupplier;
    private Supplier sensorSupplier;
    private Product sensorType;
    private UserAccount roadMaintainer;

    public UserAccount getRoadMaintainer() {
        return roadMaintainer;
    }

    public void setRoadMaintainer(UserAccount roadMaintainer) {
        this.roadMaintainer = roadMaintainer;
    }

    public Road() {
        roadid = count;
        count++;
    }

    public int getRoadid() {
        return roadid;
    }

    public void setRoadid(int roadid) {
        this.roadid = roadid;
    }

    public String getRoadName() {
        return roadName;
    }

    public void setRoadName(String roadName) {
        this.roadName = roadName;
    }

    public String getRoadLocation() {
        return roadLocation;
    }

    public void setRoadLocation(String roadLocation) {
        this.roadLocation = roadLocation;
    }

    public int getRoadPrice() {
        return roadPrice;
    }

    public void setRoadPrice(int roadPrice) {
        this.roadPrice = roadPrice;
    }

    public int getNoOfSensors() {
        return noOfSensors;
    }

    public void setNoOfSensors(int noOfSensors) {
        this.noOfSensors = noOfSensors;
    }

    public Supplier getRoadSupplier() {
        return roadSupplier;
    }

    public void setRoadSupplier(Supplier roadSupplier) {
        this.roadSupplier = roadSupplier;
    }

    public Supplier getSensorSupplier() {
        return sensorSupplier;
    }

    public void setSensorSupplier(Supplier sensorSupplier) {
        this.sensorSupplier = sensorSupplier;
    }

    public Product getSensorType() {
        return sensorType;
    }

    public void setSensorType(Product sensorType) {
        this.sensorType = sensorType;
    }

    @Override
    public String toString() {
        return roadName;
    }

}
