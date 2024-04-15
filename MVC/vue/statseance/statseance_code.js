statseance.tpl.querySelector('bouton-son-1').addEventListener('click', function() {
    statseance.tpl.getElementById('sonore_capt1').style.display = 'block';
    statseance.tpl.getElementById('sonore_capt2').style.display = 'none';
    statseance.tpl.getElementById('sonore_capt3').style.display = 'none';
});

statseance.tpl.querySelector('bouton-son-2').addEventListener('click', function() {
    statseance.tpl.getElementById('sonore_capt1').style.display = 'none';
    statseance.tpl.getElementById('sonore_capt2').style.display = 'block';
    statseance.tpl.getElementById('sonore_capt3').style.display = 'none';
});

statseance.tpl.querySelector('bouton-son-3').addEventListener('click', function() {
    statseance.tpl.getElementById('sonore_capt1').style.display = 'none';
    statseance.tpl.getElementById('sonore_capt2').style.display = 'none';
    statseance.tpl.getElementById('sonore_capt3').style.display = 'block';
});
