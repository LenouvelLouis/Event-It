<?php
/**
 * Get the statistics of a session
 * @return void
 */
function getStatSeance(){
    ob_start();
    require './controle/utilisateur.php';
    closedNotifier();
    $id = isset($_GET['id']) ? $_GET['id'] : null;
    require('./modele/statBD.php');
    $stattemperature = getStatSeanceTemperature($id);
    $statson = getStatSeanceSon($id);
    if(!$stattemperature[0] || !$statson[0] || $stattemperature[0]['id'] === null || $statson[0]['id'] === null){
        $msgErr = "Aucune statistique pour cette séance";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        http_response_code(401);
        echo json_encode(array('error' => $msgErr));
        return;
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
    ob_end_flush();
    echo json_encode($stat);

}

/**
 * Calculate the median of an array
 * @param $array
 * @return float|int|mixed
 */
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

/**
 * Calculate the mean of an array
 * @param $array
 * @return float|int
 */
function calculateMean($array) {
    $count = count($array);
    $sum = array_sum($array);
    $mean = $sum / $count;
    return $mean;
}

/**
 * Calculate the mode of an array
 * @param $array
 * @return float
 */
function calculateMode($array) {
    $array = array_map('strval', $array);
    $values = array_count_values($array);
    $mode = array_search(max($values), $values);
    return floatval($mode);
}


?>
