<?php
function tram()
{
    require('./modele/dataCapteurBD.php');
    dropDataSound();
    dropDataTemperature();
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
    $dateLimit = DateTime::createFromFormat('H:i', '14:52');

    for ($i=count($data_tab)-300; $i<count($data_tab)-1; $i++) {
        $trame = $data_tab[$i];
        list($t, $o, $r, $c, $n, $v, $a, $x, $year, $month, $day, $hour, $min, $sec) =
            sscanf($trame, "%1s%4s%1s%1s%2s%4s%4s%2s%4s%2s%2s%2s%2s%2s");
        if (preg_match('/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$/', $trame, $matches)) {
            $year = $matches[1];
            $month = $matches[2];
            $day = $matches[3];
            $hour = $matches[4];
            $minute = $matches[5];
            $second = $matches[6];
        }
        $dateTrame = DateTime::createFromFormat('Y-m-d H:i:s', "$year-$month-$day $hour:$minute:$second");
        if ($dateTrame > $dateLimit && $v!==null) {
            $v_decimal = hexdec($v);
            if ($v_decimal > 30 && $v_decimal < 100) {
                echo " Temperature $v: $v_decimal<br />";
                soundToDB($id_capteur, $v_decimal, $dateTrame);
            }
            if($v_decimal<30 && $v_decimal>0){
                echo " Sound $v: $v_decimal<br />";
                temperatureToDB($id_capteur, $v_decimal, $dateTrame);
            }
        }
    }
    //$data_tab = array_reverse($data_tab);
    /*
     * $dateSound = DateTime::createFromFormat('H:i', '14:52');
    $dateTemp = DateTime::createFromFormat('H:i', '14:52');
     * $nbSound = 0;
    $i = 0;
    while ($nbSound<100) {
        $trame = $data_tab[$i];
        $t = substr($trame, 0, 1);
        $o = substr($trame, 1, 4);
        list($t, $o, $r, $c, $n, $v, $a, $x, $year, $month, $day, $hour, $min, $sec) =
            sscanf($trame, "%1s%4s%1s%1s%2s%4s%4s%2s%4s%2s%2s%2s%2s%2s");
        $v_decimal = hexdec($v);
        if($v_decimal>30 && $v_decimal<100){
            echo " $trame<br />";
            soundToDB($id_capteur, $v_decimal,$dateSound);
            $nbSound++;
            $dateSound->modify('+3 minutes');
            if (preg_match('/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$/', $trame, $matches)) {
                $year = $matches[1];
                $month = $matches[2];
                $day = $matches[3];
                $hour = $matches[4];
                $minute = $matches[5];
                $second = $matches[6];

                // Formatage et affichage des données extraites
                echo "Trame: $trame<br />";
                echo "Date: $year-$month-$day $hour:$minute:$second<br />";
            }

        }
        $i++;
    }
    $nbTemp = 0;
    $y=0;
    while($nbTemp<100){
        $trame = $data_tab[$y];
        $t = substr($trame, 0, 1);
        $o = substr($trame, 1, 4);
        list($t, $o, $r, $c, $n, $v, $a, $x, $year, $month, $day, $hour, $min, $sec) =
            sscanf($trame, "%1s%4s%1s%1s%2s%4s%4s%2s%4s%2s%2s%2s%2s%2s");
        $v_decimal = hexdec($v);
        if($v_decimal<30 && $v_decimal>0){
            echo "Temperature $v: $v_decimal<br />";
            temperatureToDB($id_capteur, $v_decimal, $dateTemp);
            $dateTemp->modify('+3 minutes');
            $nbTemp++;
            if (preg_match('/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$/', $trame, $matches)) {
                $year = $matches[1];
                $month = $matches[2];
                $day = $matches[3];
                $hour = $matches[4];
                $minute = $matches[5];
                $second = $matches[6];
                echo "Trame: $trame<br />";
                echo "Date: $year-$month-$day $hour:$minute:$second<br />";
            }
        }
        $y++;
    }*/
}

?>