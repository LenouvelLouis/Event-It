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
/**
 * Fonction de génération de sel
 * @return string
 */
function generateSalt(): string
{
    try {
        return base64_encode(random_bytes(22));
    } catch (\Random\RandomException $e) {
    }

}
?>