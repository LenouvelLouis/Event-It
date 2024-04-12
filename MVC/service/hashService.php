<?php
/**
 * Fonction de génération de mot de passe crypté
 * @param $password
 * @param $salt
 * @return string
 */
function hashPassword($password, $salt): string
{
    $prefix = sprintf("$2y$%02d$", 10);
    return crypt($password, $prefix . $salt);
}

?>