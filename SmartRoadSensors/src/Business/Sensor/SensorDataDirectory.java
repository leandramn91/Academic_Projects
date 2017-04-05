/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Sensor;

import java.util.ArrayList;

/**
 *
 * @author Leandra
 */
public class SensorDataDirectory {

    private ArrayList<Sensor> sensorDataList;

    public SensorDataDirectory() {
        sensorDataList = new ArrayList<>();
    }

    public ArrayList<Sensor> getSensorDataList() {
        return sensorDataList;
    }

    public void setSensorDataList(ArrayList<Sensor> sensorDataList) {
        this.sensorDataList = sensorDataList;
    }

}
