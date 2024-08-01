%% Download Station List from UNR
% See http://geodesy.unr.edu/PlugNPlayPortal.php
% Citation: Blewitt 2018. https://doi.org/10.1029/2018EO104623
% Full citation at above link or DOI

function Station= downloadUNRStations

UNRStationList= "http://geodesy.unr.edu/NGLStationPages/DataHoldings.txt";

T= readtable(UNRStationList);

Station= table;
Station.ID= string(T.Var1);
Station.Latitude= T.Var2;
Station.Longitude= T.Var3;
Station.Elevation_m= T.Var4;
Station.StartDate= T.Var8;
Station.EndDate= T.Var9;

I= Station.Longitude > 180;
Station.Longitude(I)= Station.Longitude(I)- 360;

Station.Properties.VariableUnits= ["","degrees","degrees","meters","",""];

end


