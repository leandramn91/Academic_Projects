/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Sensor;

/**
 *
 * @author Leandra
 */
public class Sensor {

    private String sensorStreetName;
    private String sensorRoadStatus;
    private String sensorLocation;
    private int sensorStatus;
    private String sensorWeatherStatus;
    private String sensorTraffic;
    private String sensorVerdict;

    public String getSensorTraffic() {
        return sensorTraffic;
    }

    public void setSensorTraffic(String sensorTraffic) {
        this.sensorTraffic = sensorTraffic;
    }

    public String getSensorStreetName() {
        return sensorStreetName;
    }

    public void setSensorStreetName(String sensorStreetName) {
        this.sensorStreetName = sensorStreetName;
    }

    public String getSensorRoadStatus() {
        return sensorRoadStatus;
    }

    public void setSensorRoadStatus(String sensorRoadStatus) {
        this.sensorRoadStatus = sensorRoadStatus;
    }

    public String getSensorLocation() {
        return sensorLocation;
    }

    public void setSensorLocation(String sensorLocation) {
        this.sensorLocation = sensorLocation;
    }

    public int getSensorStatus() {
        return sensorStatus;
    }

    public void setSensorStatus(int sensorStatus) {
        this.sensorStatus = sensorStatus;
    }

    public String getSensorWeatherStatus() {
        return sensorWeatherStatus;
    }

    public void setSensorWeatherStatus(String sensorWeatherStatus) {
        this.sensorWeatherStatus = sensorWeatherStatus;
    }

    public String getSensorVerdict() {
        return sensorVerdict;
    }

    public void setSensorVerdict(String sensorVerdict) {
        this.sensorVerdict = sensorVerdict;
    }

}
