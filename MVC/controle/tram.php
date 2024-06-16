<?php
function tram()
{
    $ch = curl_init();
    curl_setopt(
        $ch,
        CURLOPT_URL,
        "http://projets-tomcat.isep.fr:8080/appService?ACTION=GETLOG&TEAM=G08a");
    curl_setopt($ch, CURLOPT_HEADER, FALSE);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    $data = curl_exec($ch);
    curl_close($ch);
    //echo "Raw Data:<br />";
    //echo("$data");

    $data_tab = str_split($data,33);
    echo "Tabular Data:<br />";
    for($i=0, $size=count($data_tab); $i<$size; $i++){
        $trame = $data_tab[$i];
        list($t, $o, $r, $c, $n, $v, $a, $x, $year, $month, $day, $hour, $min, $sec) =
            sscanf($trame,"%1s%4s%1s%1s%2s%4s%4s%2s%4s%2s%2s%2s%2s%2s");
        $t = substr($trame,0,1);
        $o = substr($trame,1,4);
        echo "Trame $i: $v<br />";
    }
   // $trame = $data_tab[1];


    //echo("<br />$t,$o,$r,$c,$n,$v,$a,$x,$year,$month,$day,$hour,$min,$sec<br />");
}

?>