package com.sudonick.campuscareerconnect.models;

public class PlacedObject<T> {
    public  T object;
    public boolean placed;
    public int appId;

    public PlacedObject(T object, int appId, boolean placed){
        this.object = object;
        this.placed = placed;
        this.appId = appId;
    }
}
