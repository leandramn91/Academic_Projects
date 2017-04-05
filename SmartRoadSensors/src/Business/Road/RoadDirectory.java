/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Road;

import java.util.ArrayList;

/**
 *
 * @author Leandra
 */
public class RoadDirectory {

    private ArrayList<Road> roadList;

    public RoadDirectory() {
        roadList = new ArrayList<>();
    }

    public ArrayList<Road> getRoadList() {
        return roadList;
    }

    public Road createRoad() {
        Road road = new Road();
        roadList.add(road);
        return road;
    }

}
