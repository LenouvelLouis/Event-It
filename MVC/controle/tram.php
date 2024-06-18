<?php
function tram()
{
    require('./modele/dataCapteurBD.php');
    dropDataSound();
    dropDataTemperature();
    $date = DateTime::createFromFormat('H:i', '14:52');
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

    $id_capteur = 1;
    $data_tab = str_split($data, 33);
    for ($i = 0; $i <600; $i++) {
        $trame = $data_tab[$i];
        $t = substr($trame, 0, 1);
        $o = substr($trame, 1, 4);
        list($t, $o, $r, $c, $n, $v, $a, $x, $year, $month, $day, $hour, $min, $sec) =
            sscanf($trame, "%1s%4s%1s%1s%2s%4s%4s%2s%4s%2s%2s%2s%2s%2s");
        $v_decimal = hexdec($v);
        if($v_decimal>30 && $v_decimal<100){
            echo "Dbm $v: $v_decimal<br />";
            soundToDB($id_capteur, $v_decimal,$date);
        }
        if($v_decimal<30 && $v_decimal>0){
            echo "Temperature $v: $v_decimal<br />";
            temperatureToDB($id_capteur, $v_decimal, $date);
        }
        $date->modify('+3 minutes');
    }
}

?>