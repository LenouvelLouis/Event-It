<?php
function getStatSeance(){
    $id = $_GET['id'] ?? null;
    require('./modele/statBD.php');
    $stattemperature = getStatSeanceTemperature($id);
    $statson = getStatSeanceSon($id);
    if($stattemperature == null || $statson == null){
        header("Location:./?path=pages/accueil");
    }
    $valeurs = array_column($stattemperature, 'valeur');
    $valeurs = array_map('floatval', $valeurs);
    $median = calculateMedian($valeurs);
    $mean = calculateMean($valeurs);
    $mode = calculateMode($valeurs);
    $stattemperature['median'] = $median;
    $stattemperature['mean'] = $mean;
    $stattemperature['mode'] = $mode;
    $valeurs = array_column($statson, 'valeur');
    $valeurs = array_map('floatval', $valeurs);
    $median = calculateMedian($valeurs);
    $mean = calculateMean($valeurs);
    $mode = calculateMode($valeurs);
    $statson['median'] = $median;
    $statson['mean'] = $mean;
    $statson['mode'] = $mode;
    $stat = array('temperature' => $stattemperature, 'son' => $statson);
    echo json_encode($stat);
}
function calculateMedian($array) {
    sort($array);
    $count = count($array);
    $middleval = floor(($count-1)/2);
    if($count % 2) {
        $median = $array[$middleval];
    } else {
        $low = $array[$middleval];
        $high = $array[$middleval+1];
        $median = (($low+$high)/2);
    }
    return $median;
}

function calculateMean($array) {
    $count = count($array);
    $sum = array_sum($array);
    $mean = $sum / $count;
    return $mean;
}

function calculateMode($array) {
    // Convert float values to strings
    $array = array_map('strval', $array);

    $values = array_count_values($array);
    $mode = array_search(max($values), $values);

    // Convert the mode back to float before returning
    return floatval($mode);
}


?>
